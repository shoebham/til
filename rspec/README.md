### Category rspec

---

 - [Check Specific Arguments To Received Method](#check-specific-arguments-to-received-method)
 - [Find Minimal Set Of Tests Causing Flicker](#find-minimal-set-of-tests-causing-flicker)
 - [Use Specific Cache Store In A Single Test](#use-specific-cache-store-in-a-single-test)

---

# Check Specific Arguments To Received Method

Let's say we have a method receiving a big hash of arguments. A hash like this:

```ruby
{
  name: 'Taco Tray',
  product_id: 'taco123',
  price: 4500,
  description: 'A big tray of tacos',
  discounts: {
    coupon: 'DISCOUNT_TACOS'
  }
}
```

In an RSpec test we want to check one of those hash values in a certain
scenario. It can be tedious to type out and check the entire hash. Instead, we
want the test to surgically check just one part of the hash.

We can do this with RSpec's dynamic matcher syntax. The [`hash_including`
argument
matcher](https://rspec.info/documentation/3.4/rspec-mocks/RSpec/Mocks/ArgumentMatchers.html#hash_including-instance_method)
can be nested within the `#with` part of `expect().to receive().with()`.

```ruby
expect(TacoTruck)
  .to receive(:take_order)
  .with(
    hash_including(
      discounts: { coupon: 'DISCOUNT_TACOS'}
    )
  )
```

This will assert about the `discounts` portion of the hash that `#take_order`
gets called with. The rest of the hash will be ignored.

Without `hash_including`, the `with` call would result in a failure when trying
to match against the entire hash.

# Find Minimal Set Of Tests Causing Flicker

You have a pretty reliable test suite. However, every once in a while CI will
fail. It fails for some test that doesn't seem to be related to the PR. And if
you re-run CI, it may not fail a subsequent time.

Your test suite has a flicker.

Because this flickering test fails so sporadically, it can be hard to track
down when it fails and why.

[RSpec comes with a `--bisect`
flag](https://relishapp.com/rspec/rspec-core/docs/command-line/bisect) that can
help you track down the _minimal_ sequence of tests that will produce a
failure. So, the next time CI fails unexpectedly on this flickering test, grab
the seed for that test run and use it locally to perform a bisect.

```bash
$ rspec --seed 1234 --bisect
```

This while take a while to run, but when it is done, it should output an
`rspec` command with a series of specific tests. Copy, paste, and run this
command as you work on tracking down the issue. One strong possibility is that
one test is altering some global state in a way that the other test doesn't
expect. And it is only in this order that you can see that manifest as a
failure.

# Use Specific Cache Store In A Single Test

It is generally recommended to use `:null_store` as the default cache store
across your test suite. This is defined in `config/environments/test.rb`.

```ruby
  config.cache_store = :null_store
```

This generally simplifies tests by avoiding confusing stateful scenarios.

If there is a test where you want to observe specific caching behavior, then
you'll need to temporarily swap that for another store.

One way to do that is by mocking the cache with `MemoryStore` in a before
block.

```ruby
describe '#caching_feature' do
  # use MemoryStore cache for these tests
  before do
    allow(Rails)
      .to receive(:cache)
      .and_return(ActiveSupport::Cache::MemoryStore.new)
  end

  it 'does caching' do
    thing = Thing.caching_feature(1)

    expect(thing.value).to eq true

    thing.update(value: false)

    thing = Thing.caching_feature(1)

    expect(thing.value).to eq true
  end
end
```

[One source](https://stackoverflow.com/a/31932795/535590) and [another](https://makandracards.com/makandra/46189-how-to-rails-cache-for-individual-rspec-tests)

