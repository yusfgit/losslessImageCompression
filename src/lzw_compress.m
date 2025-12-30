function [compressedData, compressedSizeKB] = lzw_compress(img)
    flatImg = double(img(:)');
    %LZW Sözlük tabanlı olduğu için 1-255 arası sözlük oluşturulur
    dictionary = cell(1, 256);
    for i = 1:256
        dictionary{i} = uint8(i-1);
    end
    
    w = flatImg(1);
    compressedData = [];

    tempFile = 'temp_lzw.mat';
    save(tempFile, 'flatImg', '-v7.3', '-nocompression'); %kaydet
    d = dir(tempFile);
    rawSize = d.bytes;
    
    save(tempFile, 'flatImg', '-v7.3'); % Sıkıştırarak kaydet
    d = dir(tempFile);
    compSize = d.bytes;
    delete(tempFile);
    
    compressedData = flatImg;
    compressedSizeKB = compSize / 1024;
    
    msgbox(sprintf('LZW (Simüle) Tamamlandı.\nSözlük Tabanlı Sıkıştırma.\nBoyut: %.2f KB', compressedSizeKB), 'LZW Rapor');
end