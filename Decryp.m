img=imread("bks_en.jpg");
R1=img(:,:,1);
G1=img(:,:,2);
B1=img(:,:,3);
key=input("Enter your secret key:");
key_b=de2bi(key);
for i=length(key_b)+1:8
    key_b(i)=0;

end
%display(key_b);

%Get_length
len_b=[0,0,0,0,0,0,0,0];
R_1_1_b=de2bi(R1(1,1));
G_1_1_b=de2bi(G1(1,1));
B_1_1_b=de2bi(B1(1,1));
len_b(1)=R_1_1_b(1);
len_b(2)=R_1_1_b(2);
len_b(3)=R_1_1_b(3);
len_b(4)=G_1_1_b(1);
len_b(5)=G_1_1_b(2);
len_b(6)=G_1_1_b(3);
len_b(7)=B_1_1_b(1);
len_b(8)=B_1_1_b(2);
%display(len_b);

%Get En_Text
r=2;
c=1;
message="";
index=1;
for i=1:bi2de(len_b)

    R2=de2bi(R1(r,c));
    G2=de2bi(G1(r,c));
    B2=de2bi(B1(r,c));
    
    en_txt_b=[0,0,0,0,0,0,0,0];
    en_txt_b(1)=R2(1);
    en_txt_b(2)=R2(2);
    en_txt_b(3)=R2(3);
    en_txt_b(4)=G2(1);
    en_txt_b(5)=G2(2);
    en_txt_b(6)=G2(3);
    en_txt_b(7)=B2(1);
    en_txt_b(8)=B2(2);
    %display(en_txt_b)

    r=r+1;
    if r>size(R1,1)
        c=2;
        r=r+1;
    end

    mess_c_b=xor(key_b,en_txt_b);
    mess_c_asc=bi2de(mess_c_b);
   % display(mess_c_asc)
    mess_c=char(mess_c_asc); %To convert ascii to character
    message(index)=mess_c;
    index=index+1;
    
end

display((message));