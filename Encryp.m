img=imread("bks1.png");
%imshow(img);
R1=img(:,:,1);
G1=img(:,:,2);
B1=img(:,:,3);

%imshow(R1)
%imshow(G1)
%imshow(B1)
%display(R1)
mess=input("Enter your secret message:",'s');
%display(mess);

%Length Handling
mess_len=length(mess);
% display(mess_len);
mess_len_b=de2bi(mess_len);
%display(mess_len_b);
len_of_b=length(mess_len_b);
for i=len_of_b+1:8
     mess_len_b(i)=0;
    
end    
 %display(mess_len_b);
 
 %display(mess_len_b(1));
 %display(R1(1,1));
 %R1(1,1)=254;
 %display(R1);
 R_1_1_b=de2bi(R1(1,1));
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
 R1(1,1)=bi2de(R_1_1_b);
 G1(1,1)=bi2de(G_1_1_b);
 B1(1,1)=bi2de(B_1_1_b);

% Handling Secret Key
 key=input("Please! Enter Secret Key:");
 %display(key);
 key_b=de2bi(key);
 for i=length(key_b)+1:8
     key_b(i)=0;
 end
 %display(key_b);


 % Messeage Handling
 mess_asc=double(mess);
 %To find out ascii value of our message.
 %display(mess_asc);
 r=2;
 c=1;
 for i=1:mess_len
mess_asc_b=de2bi(mess_asc(i));
 %display(mess_asc_b);
    for j=length(mess_asc_b)+1:8

     mess_asc_b(j)=0;
    end
    en_msg=xor(mess_asc_b,key_b);
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
        c=2;
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
 imwrite(en_img1,"bks_en.jpg","bmp");
 R1=en_img1(:,:,1);
 G1=en_img1(:,:,2);
 B1=en_img1(:,:,3);