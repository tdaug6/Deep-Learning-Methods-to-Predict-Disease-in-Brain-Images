#!/bin/bash
ANAT_MEAN=/home/drcc/ADHD200/ADHD200_summary_anat_mean.nii.gz
ANAT_SD=/home/drcc/ADHD200/ADHD200_summary_anat_sd.nii.gz
GM_MEAN=/home/drcc/ADHD200/ADHD200_summary_gm_mean.nii.gz
GM_SD=/home/drcc/ADHD200/ADHD200_summary_gm_sd.nii.gz
REST_MEAN=/home/drcc/ADHD200/ADHD200_summary_rest_mean.nii.gz
REST_SD=/home/drcc/ADHD200/ADHD200_summary_rest_sd.nii.gz
FALFF_MEAN=/home/drcc/ADHD200/ADHD200_summary_falff_mean.nii.gz
FALFF_SD=/home/drcc/ADHD200/ADHD200_summary_falff_sd.nii.gz
FC_MEAN=/home/drcc/ADHD200/ADHD200_summary_fc_mean.nii.gz
FC_SD=/home/drcc/ADHD200/ADHD200_summary_fc_sd.nii.gz

# get a list of sessions
anat_files=`ls wssd*anat.nii.gz`
  
for anat_file in ${anat_files}
do
    if [ ! -f __z_${anat_file} ]
    then
        3dcalc -prefix __z_${anat_file} -a ${anat_file} -b ${ANAT_MEAN} -c ${ANAT_SD} \
            -expr "abs((a-b)/c)" -float
    fi

    if [ ! -f __mz_${anat_file} ]
    then
        3dcalc -prefix __mz_${anat_file} -a __z_${anat_file} -expr "step(a-3)" -short
    fi

    ff=`3dROIstats -mask __mz_${anat_file} -nzsum __z_${anat_file}`
    echo "${ff}"
done

# get a list of sessions
gm_files=`ls wssd*anat_gm.nii.gz`
  
for gm_file in ${gm_files}
do
    if [ ! -f __z_${gm_file} ]
    then
        3dcalc -prefix __z_${gm_file} -a ${gm_file} -b ${GM_MEAN} -c ${GM_SD} \
            -expr "abs((a-b)/c)" -float
    fi

    if [ ! -f __mz_${gm_file} ]
    then
        3dcalc -prefix __mz_${gm_file} -a __z_${gm_file} -expr "step(a-3)" -short
    fi

    ff=`3dROIstats -mask __mz_${gm_file} -nzsum __z_${gm_file}`
    echo "${ff}"
done

rest_files=`ls wmean*rest*.nii.gz`
  
for rest_file in ${rest_files}
do
    if [ ! -f __z_${rest_file} ]
    then
        3dcalc -prefix __z_${rest_file} -a ${rest_file} -b ${REST_MEAN} -c ${REST_SD} \
            -expr "abs((a-b)/c)" -float
    fi

    if [ ! -f __mz_${rest_file} ]
    then
        3dcalc -prefix __mz_${rest_file} -a __z_${rest_file} -expr "step(a-3)" -short
    fi

    ff=`3dROIstats -mask __mz_${rest_file} -nzsum __z_${rest_file}`
    echo "${ff}"
done

falff_files=`ls fal*rest*.nii.gz`
  
for falff_file in ${falff_files}
do
    if [ ! -f __z_${falff_file} ]
    then
        3dcalc -prefix __z_${falff_file} -a ${falff_file} -b ${FALFF_MEAN} -c ${FALFF_SD} \
            -expr "abs((a-b)/c)" -float
    fi

    if [ ! -f __mz_${falff_file} ]
    then
        3dcalc -prefix __mz_${falff_file} -a __z_${falff_file} -expr "step(a-3)" -short
    fi

    ff=`3dROIstats -mask __mz_${falff_file} -nzsum __z_${falff_file}`
    echo "${ff}"
done

fc_files=`ls fc*rest*.nii.gz`
  
for fc_file in ${fc_files}
do
    if [ ! -f __z_${fc_file} ]
    then
        3dcalc -prefix __z_${fc_file} -a ${fc_file} -b ${FC_MEAN} -c ${FC_SD} \
            -expr "abs((a-b)/c)" -float
    fi

    if [ ! -f __mz_${fc_file} ]
    then
        3dcalc -prefix __mz_${fc_file} -a __z_${fc_file} -expr "step(a-3)" -short
    fi

    ff=`3dROIstats -mask __mz_${fc_file} -nzsum __z_${fc_file}`
    echo "${ff}"
done
