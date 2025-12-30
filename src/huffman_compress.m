function [compressedData, compressedSizeKB] = huffman_compress(img)
    flatImg = double(img(:)); 
    totalPixels = length(flatImg);
    
    if totalPixels == 0
        error('Görüntü verisi boş!');
        return;
    end

    %histogram
    [~, ~, idx] = unique(flatImg);
    counts = accumarray(idx, 1);
    
    %Olasılıklar ve tahmin
    p = counts ./ totalPixels;
    
    %Entropi - pixel değerlerinin dağınıklığı
    entropy = -sum(p .* log2(p));
    
    %boyut
    totalBits = ceil(totalPixels * entropy);
   
    headerBits = length(counts) * 8; 
    
    %kB Cinsinden Boyut
    totalSizeBits = totalBits + headerBits;
    compressedSizeKB = (totalSizeBits / 8) / 1024;
    
    % Görsel verisini döndür
    compressedData = flatImg; 
    
    %Uyarı Mesajı
    msgbox(sprintf('Entropi: %.4f\nBoyut: %.2f KB', entropy, compressedSizeKB), 'Bilgi');
end