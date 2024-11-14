img=imread("RGB_image.jpg");
%imshow(img);
R1=img(:,:,1);
G1=img(:,:,2);
B1=img(:,:,3);

%imshow(R1) % Red part will be white
%imshow(G1) % Green part will be white
%imshow(B1) % Blue part will be white
%display(R1)
mess=input("Enter your secret message:",'s');
%display(mess);

%Length Handling
mess_len=length(mess);
% display(mess_len);
mess_len_b=de2bi(mess_len);
%display(mess_len_b);
len_of_b=length(mess_len_b);

% Add 0s to complete 8 bits (If message is Hey, then length = 3 [ 1 1 ] )

for i=len_of_b+1:8
     mess_len_b(i)=0;
    
end    
 %display(mess_len_b);
 % so add 0s to make it [ 1 1 0 0 0 0 0 0 ]
 
 %display(mess_len_b(1)); % bit(1) means LSB 
 
 %display(R1(1,1)); 

 %R1(1,1)=254; % 1st row and 1st Col of R1
 %display(R1);
 R_1_1_b=de2bi(R1(1,1)); % binary of R's pixel value of 1st row and 1st col
 G_1_1_b=de2bi(G1(1,1));
 B_1_1_b=de2bi(B1(1,1)); 
 %display(R_1_1_b);

 R_1_1_b(1)=mess_len_b(1);
 R_1_1_b(2)=mess_len_b(2);
 R_1_1_b(3)=mess_len_b(3);
 G_1_1_b(1)=mess_len_b(4);
 G_1_1_b(2)=mess_len_b(5);
 G_1_1_b(3)=mess_len_b(6);
 B_1_1_b(1)=mess_len_b(7);
 B_1_1_b(2)=mess_len_b(8);

 
 R1(1,1)=bi2de(R_1_1_b); %Replace R1(1,1) with new formed pixel value
 G1(1,1)=bi2de(G_1_1_b); %Replace G1(1,1) with new formed pixel value
 B1(1,1)=bi2de(B_1_1_b); %Replace B1(1,1) with new formed pixel value
 
% Handling Secret Key
 key=input("Please! Enter Secret Key:");
 %display(key);
 % should be b/w 0 - 255
 key_b=de2bi(key);
 for i=length(key_b)+1:8
     key_b(i)=0;
 end


 %display(key_b);


 % Messeage Handling
 mess_asc=double(mess);
 %To find out ascii value of our message.
 % if messeage is Hey -> [ 72(ASCII of 'H') 101 121 ]  
 %display(mess_asc);
 r=2; %skip first row which stores length
 c=1;
 for i=1:mess_len % from 1 to message length
mess_asc_b=de2bi(mess_asc(i)); % binary of ASCII value of each character
 %display(mess_asc_b);
    for j=length(mess_asc_b)+1:8

     mess_asc_b(j)=0;
    end
    %again add 0s if length of ASCII value's is less than 8
    en_msg=xor(mess_asc_b,key_b);
    % xor(01001000(72), 11111111(255)) = 183
   % display(R1(r,c));
    R2=de2bi(R1(r,c));
    G2=de2bi(G1(r,c));
    B2=de2bi(B1(r,c));
    R2(1)=en_msg(1);
    R2(2)=en_msg(2);
    R2(3)=en_msg(3);
    G2(1)=en_msg(4);
    G2(2)=en_msg(5);
    G2(3)=en_msg(6);
    B2(1)=en_msg(7);
    B2(2)=en_msg(8);
    R1(r,c)=bi2de(R2);
    G1(r,c)=bi2de(G2);
    B1(r,c)=bi2de(B2);
    %display(R1(r,c));
    r=r+1;
    if(r>size(img,1))
        c=2; %if row ends then move to next col
        r=r+1;
    end
   
 end

%imshow(R1);

 en_img = zeros([size(R1) 3]);
 en_img(:,:,1)=R1;
 en_img(:,:,2)=G1;
 en_img(:,:,3)=B1;
 en_img1 = uint8(en_img);
 imshow(en_img1);
 imwrite(en_img1,"RGB_img_en.jpg","bmp");
 R1=en_img1(:,:,1);
 G1=en_img1(:,:,2);
 B1=en_img1(:,:,3);
 
 