% Preparation of the data
T1 = readtable('patient1_final.xlsx');
h1 = height(T1);
w1 = width(T1);
Tableau1=zeros(h1,w1);
for colonne = 1:w1
    temp = T1(:,colonne).Variables;
    if colonne == 1
        temp = temp/10000000000;
    end   
    if ~iscell(temp(2))       
    value = 0;
        for ligne = 1:h1            
            if (~isnan(temp(ligne)))
                if temp(ligne)==0 && ligne>1 
                    Tableau1(ligne,colonne) = value;
                else
                    value = temp(ligne);
                    Tableau1(ligne,colonne) = value;
                end
               
            else    
               Tableau1(ligne,colonne) = value;
            end
        end
    else 
        value = 0;
        for ligne = 1:h1
            cell=temp(ligne);
            if cell{1,1}==""
                Tableau1(ligne,colonne) = value;
            else                 
                value=str2double(cell{1,1});
                Tableau1(ligne,colonne) = value;
            end
        end
    end
end


T2 = readtable('patient2_final.xlsx');
h2 = height(T2);
w2 = width(T2);
Tableau2=zeros(h,w2);
for colonne = 1:w2
    temp = T2(:,colonne).Variables;
    if colonne == 1
        temp = temp/10000000000;
    end   
    if ~iscell(temp(2))       
    value = 0;
        for ligne = 1:h2            
            if (~isnan(temp(ligne)))
                if temp(ligne)==0 && ligne>1 
                    Tableau2(ligne,colonne) = value;
                else
                    value = temp(ligne);
                    Tableau2(ligne,colonne) = value;
                end
               
            else    
               Tableau2(ligne,colonne) = value;
            end
        end
    else 
        value = 0;
        for ligne = 1:h2
            cell=temp(ligne);
            if cell{1,1}==""
                Tableau2(ligne,colonne) = value;
            else                 
                value=str2double(cell{1,1});
                Tableau2(ligne,colonne) = value;
            end
        end
    end
end


T3 = readtable('patient3_final.xlsx');
h3 = height(T3);
w3 = width(T3);
Tableau3=zeros(h3,w3);
for colonne = 1:w3
    temp = T3(:,colonne).Variables;
    if colonne == 1
        temp = temp/10000000000;
    end   
    if ~iscell(temp(2))       
    value = 0;
        for ligne = 1:h3           
            if (~isnan(temp(ligne)))
                if temp(ligne)==0 && ligne>1 
                    Tableau3(ligne,colonne) = value;
                else
                    value = temp(ligne);
                    Tableau3(ligne,colonne) = value;
                end
               
            else    
               Tableau3(ligne,colonne) = value;
            end
        end
    else 
        value = 0;
        for ligne = 1:h3
            cell=temp(ligne);
            if cell{1,1}==""
                Tableau3(ligne,colonne) = value;
            else                 
                value=str2double(cell{1,1});
                Tableau3(ligne,colonne) = value;
            end
        end
    end
end


T4 = readtable('patient4_final.xlsx');
h4 = height(T4);
w4 = width(T4);
Tableau4=zeros(h4,w4);
for colonne = 1:w4
    temp = T4(:,colonne).Variables;
    if colonne == 1
        temp = temp/10000000000;
    end   
    if ~iscell(temp(2))       
    value = 0;
        for ligne = 1:h4            
            if (~isnan(temp(ligne)))
                if temp(ligne)==0 && ligne>1 
                    Tableau4(ligne,colonne) = value;
                else
                    value = temp(ligne);
                    Tableau4(ligne,colonne) = value;
                end
               
            else    
               Tableau4(ligne,colonne) = value;
            end
        end
    else 
        value = 0;
        for ligne = 1:h4
            cell=temp(ligne);
            if cell{1,1}==""
                Tableau4(ligne,colonne) = value;
            else                 
                value=str2double(cell{1,1});
                Tableau4(ligne,colonne) = value;
            end
        end
    end
end


%Calculating the derivatives #BASIC
dt1 = Tableau1(2,1) - Tableau1(1,1);
Tableau1_dot_basic=zeros(h1,w1);
for colonne = 2:w1
    for ligne = 1:h1-1
        Tableau1_dot_basic(ligne, colonne) = (Tableau1(ligne +1,colonne) - Tableau1(ligne,colonne))/1.0;
        
    end
end

dt2 = Tableau2(2,1) - Tableau2(1,1);
Tableau2_dot_basic=zeros(h2,w2);
for colonne = 2:w2
    for ligne = 1:h2-1
        Tableau2_dot_basic(ligne, colonne) = (Tableau2(ligne +1,colonne) - Tableau2(ligne,colonne))/1.0;
        
    end
end

dt3 = Tableau3(2,1) - Tableau3(1,1);
Tableau3_dot_basic=zeros(h3,w3);
for colonne = 2:w3
    for ligne = 1:h3-1
        Tableau3_dot_basic(ligne, colonne) = (Tableau3(ligne +1,colonne) - Tableau3(ligne,colonne))/1.0;
        
    end
end

dt4 = Tableau4(2,1) - Tableau4(1,1);
Tableau4_dot_basic=zeros(h4,w4);
for colonne = 2:w4
    for ligne = 1:h4-1
        Tableau4_dot_basic(ligne, colonne) = (Tableau4(ligne +1,colonne) - Tableau4(ligne,colonne))/1.0;
        
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%% Definition of seqS_basic %%%%%%%%%%%%%%%
seqS_basic1= cat(2,Tableau1(:,[2 3 4 5 6 7]),Tableau1_dot_basic(:,[2 3 4 5 6 7]));
seqS_basic2= cat(2,Tableau2(:,[2 3 4 5 6 7]),Tableau2_dot_basic(:,[2 3 4 5 6 7]));
seqS_basic3= cat(2,Tableau3(:,[2 3 4 5 6 7]),Tableau3_dot_basic(:,[2 3 4 5 6 7]));
seqS_basic4= cat(2,Tableau4(:,[2 3 4 5 6 7]),Tableau4_dot_basic(:,[2 3 4 5 6 7]));


%%%%%%%%%%%%%%%% Definition of seqT %%%%%%%%%%%%%%%
seqT1= Tableau1(:,1);
seqT2= Tableau2(:,1);
seqT3= Tableau3(:,1);
seqT4= Tableau4(:,1);


%%%%%%%%%%%%%%%% Definition of Predicates "hypotensia" %%%%%%%%%%%%%%%%
% MAP needs to be > 70
ii = 1;
preds_basic(ii).str = 'hypo1';
preds_basic(ii).A = [0 0 0 0 0 -1 0 0 0 0 0 0 ];
preds_basic(ii).b = [-70];

% Or MAP' needs to be > -20
ii = ii +1;
preds_basic(ii).str = 'hypo2';
preds_basic(ii).A = [0 0 0 0 0 0 0 0 0 0 0 -1 ];
preds_basic(ii).b = [20];

%And MAP needs to be > 65 anyways
ii = ii +1;
preds_basic(ii).str = 'hypo3';
preds_basic(ii).A = [0 0 0 0 0 -1 0 0 0 0 0 0 ];
preds_basic(ii).b = [-65];

%Definition of the MTL formula
phi_hypo = '([] ( ((hypo1)\/(hypo2)) /\ (hypo3) ))' ;



%%%%%%%%%%%%%%%% Definition of Predicates "hypertensia" %%%%%%%%%%%%%%%%
% MAP needs to be < 90
ii = ii +1;
preds_basic(ii).str = 'hyper1';
preds_basic(ii).A = [0 0 0 0 0 1 0 0 0 0 0 0 ];
preds_basic(ii).b = [90];

% Or MAP' needs to be < 20
ii = ii +1;
preds_basic(ii).str = 'hyper2';
preds_basic(ii).A = [0 0 0 0 0 0 0 0 0 0 0 1 ];
preds_basic(ii).b = [20];

%And MAP needs to be < 110 anyways
ii = ii +1;
preds_basic(ii).str = 'hyper3';
preds_basic(ii).A = [0 0 0 0 0 1 0 0 0 0 0 0 ];
preds_basic(ii).b = [110];

%Definition of the MTL formula
phi_hyper = '([] ( ((hyper1)\/(hyper2)) /\ (hyper3) ))';

%%%%%%%%%%%%%%%% Definition of Predicates "Induction of anesthesia" %%%%%%%%%%%%%%%%
%PSI e [80,100] (before)
ii = ii +1;
preds_basic(ii).str = 'depth1';
preds_basic(ii).A = [0 0 0 1 0 0 0 0 0 0 0 0 ];
preds_basic(ii).b = [100];

ii = ii +1;
preds_basic(ii).str = 'depth2';
preds_basic(ii).A = [0 0 0 -1 0 0 0 0 0 0 0 0 ];
preds_basic(ii).b = [-80];

%PSI e [25,50] (after)
ii = ii +1;
preds_basic(ii).str = 'depth3';
preds_basic(ii).A = [0 0 0 1 0 0 0 0 0 0 0 0 ];
preds_basic(ii).b = [50];

ii = ii +1;
preds_basic(ii).str = 'depth4';
preds_basic(ii).A = [0 0 0 -1 0 0 0 0 0 0 0 0 ];
preds_basic(ii).b = [-25];

%Propofol > 9 (trigger)
ii = ii +1;
preds_basic(ii).str = 'depth5';
preds_basic(ii).A = [0 -1 0 0 0 0 0 0 0 0 0 0 ];
preds_basic(ii).b = [-9];

%Definition of the MTL formula
phi_depth = '([] (depth1/\depth2) U (depth5 /\ (<>(depth1/\depth2)) ) )';

%%%%%%%%%%%%%%%% Definition of the MTL formula %%%%%%%%%%%%%%%
phi_basic = '([] ( ((hypo1)\/(hypo2)) /\ (hypo3) )) /\ ([] ( ((hyper1)\/(hyper2)) /\ (hyper3) )) /\ ([] (depth1/\depth2) U (depth5 /\ (<>(depth1/\depth2)) ) )';



rob1 = dp_taliro(phi_basic, preds_basic, seqS_basic1, seqT1);
rob2 = dp_taliro(phi_basic, preds_basic, seqS_basic2, seqT2);
rob3 = dp_taliro(phi_basic, preds_basic, seqS_basic3, seqT3);
rob4 = dp_taliro(phi_basic, preds_basic, seqS_basic4, seqT4);
