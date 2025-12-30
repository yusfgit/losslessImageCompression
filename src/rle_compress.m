function [compressedData, compressedSizeKB] = rle_compress(img)
    flatImg = img(:)'; 
    n = length(flatImg);
    
    if n == 0, error('Boş görüntü!'); end

    values = [];
    counts = [];
    
    prevVal = flatImg(1);
    count = 1;
    
    %Adım adım tarama
    for i = 2:n
        currVal = flatImg(i);
        if currVal == prevVal
            count = count + 1;
        else
            values(end+1) = prevVal;
            counts(end+1) = count;
            prevVal = currVal;
            count = 1;
        end
    end
    values(end+1) = prevVal;
    counts(end+1) = count;
    
    compressedData.values = values;
    compressedData.counts = counts;
    
    %BOYUT HESABI - kB
    totalBytes = length(values) + length(counts); 
    compressedSizeKB = totalBytes / 1024;

    %Bilgi Mesajı
    msgbox(sprintf('RLE Tamamlandı.\nOrijinal: %d piksel\nSıkışmış Blok Sayısı: %d', n, length(values)), 'RLE Rapor');
end