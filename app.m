clc
clear

%%%%%%%%%%%%%%%%%%%%%  Init Parameter

dis_map = zeros(6,3,2); %��¼��������  ���һλ��¼x,y
dis_map = init_map(dis_map);

TR_route = zeros(200,2);
PR_route = zeros(200,2); %·��
TR_route(1,:) = [1,6];
PR_route(1,:) = [3,1];
pos_TR = 1;   %��¼·��ָ��
pos_PR = 1;

length_TR = 0;
length_PR = 0;

time_node_TR = zeros(200,1);   %��¼ʱ��ڵ�
time_node_PR = zeros(200,1);
node_pos_TR = 1;
node_pos_PR = 1;

TR_timer = 0;  %���ó����򳵵�Timer
PR_timer = 0;  %���������򳵵�Timer

count_try_ball = 7;  %�����������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Set Route

para_route_PR = [3,1 ; 3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1 ; ...
                       3,3 ; 3,1 ; 3,2 ; 2,2 ; 2,1 ; 2,2 ; 3,2 ; 3,1];
                   
para_route_TR = [1,6 ; 1,5 ; 2,5 ; 3,5 ; 2,5 ; 1,5 ; ...
                       1,4 ; 2,4 ; 3,4 ; 2,4 ; 1,4 ; ...
                       1,3 ; 2,3 ; 3,3 ; 2,3 ; 1,3 ; ...
                       1,2 ; 2,2 ; 3,2 ; 2,2 ; 1,2 ; ...
                       1,2 ; 2,2 ; 3,2 ; 2,2 ; 1,2];

route = zeros(2,200,2);   %��·��
route1 = zeros(2,9,2);    %��һ��               

route(1,1:length(para_route_PR),:) = para_route_PR;
route(2,1:length(para_route_TR),:) = para_route_TR;
%1:PR 2:TR
route1(1,:,:) = route(1,1:9,:);
route1(2,1:6,:) = route(2,1:6,:);  %��һ��

route2(1,:,:) = route(1,9:17,:);
route2(2,1:6,:) = route(2,6:11,:); %�ڶ���

route3(1,:,:) = route(1,17:25,:);
route3(2,1:6,:) = route(2,11:16,:);%������

route4(1,:,:) = route(1,25:33,:);
route4(2,1:6,:) = route(2,16:21,:);%���Ĵ�

route5(1,:,:) = route(1,33:41,:);
route5(2,1:6,:) = route(2,21:26,:);%�����


%%%%%%%%%%%%%%%%%%%%%%   Estimate

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route1,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route2,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route3,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route4,dis_map);

[PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR] ...
= get_one_per(PR_timer,TR_timer,length_PR,length_TR,TR_route,PR_route,time_node_PR,time_node_TR,pos_PR,pos_TR,node_pos_PR,node_pos_TR,route5,dis_map);

