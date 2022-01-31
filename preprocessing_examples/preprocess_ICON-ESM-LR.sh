base="/pool/data/CMIP6/data/CMIP/MPI-M/ICON-ESM-LR/historical/r1i1p1f1/"
model="ICON-ESM-LR"
vararray=("siconc" "ua" "zg" "clt" "tas" "pr" "rlut" "uas" "vas")
mode="yearly" #onefile, yearly, decadal, five, four

for var in ${vararray[*]}; do
    if [[ "$var" = "siconc" ]]; then
        group="SImon"
        g="gn"
        version="v20210215"
    else
        group="Amon"
        g="gn"
        version="v20210215"
    fi
    if [[ "$mode" = "yearly" ]]; then
        ln -s $base/$group/$var/$g/$version/*_198* .
        ln -s $base/$group/$var/$g/$version/*_199* .
        ln -s $base/$group/$var/$g/$version/*_20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "onefile" ]]; then
        ln -s $base/$group/$var/$g/$version/*1850* $var
    fi
    if [[ "$mode" = "two" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* $var
    fi
    if [[ "$mode" = "five" ]]; then
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "four" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "three" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*1990* .
        ln -s $base/$group/$var/$g/$version/*201* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
done
wait

if [[ "$mode" = "onefile" ]]; then
    steps="1680/1979"
elif [[ "$mode" = "five" ]]; then
    steps="240/539"
elif [[ "$mode" = "four" ]]; then
    steps="480/779"
elif [[ "$mode" = "two" ]]; then
    steps="480/779"
elif [[ "$mode" = "three" ]]; then
    steps="480/779"
else
    steps="120/419"
fi


for var in ${vararray[*]}; do
    cdo genycon,r180x91 -selname,${var} -setgrid,/pool/data/ICON/grids/public/mpim/0013/icon_grid_0013_R02B04_G.nc $var weights_unstr_2_r180x91_${var}.nc
    if [[ "$var" = "zg" ]]; then
        cdo -seltimestep,$steps -remap,r180x91,weights_unstr_2_r180x91_${var}.nc -selname,${var} -setgrid,/pool/data/ICON/grids/public/mpim/0013/icon_grid_0013_R02B04_G.nc -sellevel,50000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    elif [[ "$var" = "ua" ]]; then
        cdo -seltimestep,$steps -remap,r180x91,weights_unstr_2_r180x91_${var}.nc -selname,${var} -setgrid,/pool/data/ICON/grids/public/mpim/0013/icon_grid_0013_R02B04_G.nc -sellevel,30000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    else
        cdo -seltimestep,$steps -remap,r180x91,weights_unstr_2_r180x91_${var}.nc -selname,${var} -setgrid,/pool/data/ICON/grids/public/mpim/0013/icon_grid_0013_R02B04_G.nc ${var} ${var}_${model}_198912-201411.nc
    fi
done
wait



for var in ${vararray[*]}; do
        cdo splitseas -yseasmean ${var}_${model}_198912-201411.nc ../../cmip6/${var}_${model}_198912-201411_
done




'
vararray=("zg" "ua")
mode="yearly" #onefile, yearly, decadal, five, four

for var in ${vararray[*]}; do
    if [[ "$var" = "siconc" ]]; then
        group="SImon"
        g="gn"
        version="v20201211"
    else
        group="Amon"
        g="gn"
        version="v20190311"
    fi
    if [[ "$mode" = "yearly" ]]; then
        ln -s $base/$group/$var/$g/$version/*_198* .
        ln -s $base/$group/$var/$g/$version/*_199* .
        ln -s $base/$group/$var/$g/$version/*_20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "onefile" ]]; then
        ln -s $base/$group/$var/$g/$version/*1850* $var
    fi
    if [[ "$mode" = "two" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* $var
    fi
    if [[ "$mode" = "five" ]]; then
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "75" ]]; then
        ln -s $base/$group/$var/$g/$version/*1975* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "four" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "three" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*1990* .
        ln -s $base/$group/$var/$g/$version/*201* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
done
wait

if [[ "$mode" = "onefile" ]]; then
    steps="1680/1979"
elif [[ "$mode" = "five" ]]; then
    steps="240/539"
elif [[ "$mode" = "four" ]]; then
    steps="480/779"
elif [[ "$mode" = "two" ]]; then
    steps="480/779"
elif [[ "$mode" = "three" ]]; then
    steps="480/779"
elif [[ "$mode" = "75" ]]; then
    steps="180/479"
else
    steps="120/419"
fi

for var in ${vararray[*]}; do
    if [[ "$var" = "zg" ]]; then
        cdo -remapbil,r180x91 -sellevel,50000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    elif [[ "$var" = "ua" ]]; then
        cdo -remapbil,r180x91 -sellevel,30000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    else
        cdo -remapbil,r180x91 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    fi
done
wait

for var in ${vararray[*]}; do
        cdo splitseas -yseasmean ${var}_${model}_198912-201411.nc ../../cmip6/${var}_${model}_198912-201411_
done





vararray=("clt")
mode="two" #onefile, yearly, decadal, five, four

for var in ${vararray[*]}; do
    if [[ "$var" = "siconc" ]]; then
        group="SImon"
        g="gn"
        version="v20201211"
    else
        group="Amon"
        g="gn"
        version="v20190311"
    fi
    if [[ "$mode" = "yearly" ]]; then
        ln -s $base/$group/$var/$g/$version/*_198* .
        ln -s $base/$group/$var/$g/$version/*_199* .
        ln -s $base/$group/$var/$g/$version/*_20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "onefile" ]]; then
        ln -s $base/$group/$var/$g/$version/*1850* $var
    fi
    if [[ "$mode" = "two" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* $var
    fi
    if [[ "$mode" = "five" ]]; then
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "75" ]]; then
        ln -s $base/$group/$var/$g/$version/*1975* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "four" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*20* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
    if [[ "$mode" = "three" ]]; then
        ln -s $base/$group/$var/$g/$version/*1950* .
        ln -s $base/$group/$var/$g/$version/*1970* .
        ln -s $base/$group/$var/$g/$version/*1990* .
        ln -s $base/$group/$var/$g/$version/*201* .
        rm -rf $var
        cdo mergetime ${var}_${group}_* $var &
    fi
done
wait

if [[ "$mode" = "onefile" ]]; then
    steps="1680/1979"
elif [[ "$mode" = "five" ]]; then
    steps="240/539"
elif [[ "$mode" = "four" ]]; then
    steps="480/779"
elif [[ "$mode" = "two" ]]; then
    steps="480/779"
elif [[ "$mode" = "three" ]]; then
    steps="480/779"
elif [[ "$mode" = "75" ]]; then
    steps="180/479"
else
    steps="120/419"
fi

for var in ${vararray[*]}; do
    if [[ "$var" = "zg" ]]; then
        cdo -remapbil,r180x91 -sellevel,50000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    elif [[ "$var" = "ua" ]]; then
        cdo -remapbil,r180x91 -sellevel,30000 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    else
        cdo -remapbil,r180x91 -seltimestep,$steps $var ${var}_${model}_198912-201411.nc &
    fi
done
wait

for var in ${vararray[*]}; do
        cdo splitseas -yseasmean ${var}_${model}_198912-201411.nc ../../cmip6/${var}_${model}_198912-201411_
done





