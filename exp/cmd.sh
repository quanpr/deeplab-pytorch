# ! /bin/bash
cd ..

dir=/home/prquan/hard_label_attack/human_study/image_pairs/img_
# dirs=($(ls ${dir}*/))

for i in {0..2};do
    _dir=$dir${i}
    # files=$(ls $_dir)
    files=$(ls $_dir)
    for filename in $files;do
        echo "Now process: $_dir/$filename"
        CUDA_VISIBLE_DEVICES=1 python demo.py single --cuda -c configs/cocostuff164k.yaml  -m deeplabv2_resnet101_msc-cocostuff164k-100000.pth -i $_dir/$filename
        break
    done
done