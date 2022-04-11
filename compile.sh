#!/bin/bash

if [ -f README.md ]; then
    if [[ "$(head -n1 README.md)" == "# TIL" ]]; then
        subs=$(grep -oE "\(.*/.*\.md\)" README.md | tr -d ')(' | cut -d '/' -f1 | sort -u)

        for tilsub in ${subs}; do
            if [ ! -d ${tilsub} ]; then continue; fi
            echo "### Category ${tilsub}" > ${tilsub}/README.md
            echo "" >> ${tilsub}/README.md
            echo "---" >> ${tilsub}/README.md
            echo "" >> ${tilsub}/README.md
            tilfiles=$(grep -oE "\(${tilsub}/.*\.md\)" README.md | tr -d ')(')
            for tilfile in ${tilfiles}; do
                if [ ! -f ${tilfile} ]; then continue; fi
                titlestring=$(grep -E "^#" ${tilfile} | sed -e "s|^# ||g" | head -n1)
                titleanchor="#$(echo "${titlestring}" | sed -e "s/ /-/g" | tr '[:upper:]' '[:lower:]')"
                echo " - [${titlestring}](${titleanchor})" >> ${tilsub}/README.md
            done
            echo "" >> ${tilsub}/README.md
            echo "---" >> ${tilsub}/README.md
            echo "" >> ${tilsub}/README.md
            for tilfile in ${tilfiles}; do
                if [ ! -f ${tilfile} ]; then continue; fi
                cat ${tilfile} >> ${tilsub}/README.md
                echo "" >> ${tilsub}/README.md
            done
        done
    else
        echo "Not in main TIL folder"
        exit 1
    fi
else
    echo "Not in main TIL folder"
    exit 1
fi
