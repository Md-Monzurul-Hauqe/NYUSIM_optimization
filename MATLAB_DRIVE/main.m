clc
clear all
close all
fobj = @mpm93_forNYU;
SearchAgents_no = 100;
Max_iter = 100;
lb = [1 3 0 -100 0];
ub = [100 1013 100 50 150];
dim = 5;

for i=1:100
    disp(['Currently running GWO ', num2str(i),'st time'])
    [result.algo(1).score(:,i),result.algo(1).pos(i,:),result.algo(1).Convergence_curve(i,:)]=GWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running WOA ', num2str(i),'st time'])
    [result.algo(2).score(:,i),result.algo(2).pos(i,:),result.algo(2).Convergence_curve(i,:)]=WOA(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running PSO ', num2str(i),'st time'])
    [result.algo(3).score(:,i),result.algo(3).pos(i,:),result.algo(3).Convergence_curve(i,:)]=PSO(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running SCA ', num2str(i),'st time'])
    [result.algo(4).score(:,i),result.algo(4).pos(i,:),result.algo(4).Convergence_curve(i,:)]=SCA(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running SSA ', num2str(i),'st time'])
    [result.algo(5).score(:,i),result.algo(5).pos(i,:),result.algo(5).Convergence_curve(i,:)]=SSA(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running HHO ', num2str(i),'st time'])
    [result.algo(6).score(:,i),result.algo(6).pos(i,:),result.algo(6).Convergence_curve(i,:)]=HHO(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running DA ', num2str(i),'st time'])
    [result.algo(7).score(:,i),result.algo(7).pos(i,:),result.algo(7).Convergence_curve(i,:)]=DA(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running MFO ', num2str(i),'st time'])
    [result.algo(8).score(:,i),result.algo(8).pos(i,:),result.algo(8).Convergence_curve(i,:)]=MFO(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running GOA ', num2str(i),'st time'])
    [result.algo(9).score(:,i),result.algo(9).pos(i,:),result.algo(9).Convergence_curve(i,:)]=GOA(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
    disp(['Currently running IGWO ', num2str(i),'st time'])
    [result.algo(10).score(:,i),result.algo(10).pos(i,:),result.algo(10).Convergence_curve(i,:)]=IGWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj);
end
figure
for j=1:10
    S = sum(result.algo(j).Convergence_curve,1);
    plot(1:100,S)
    hold on
    grid on
    grid minor
    xlabel('iteration')
    ylabel('Average Attenuation [dB/m]')
end
legend('GWO','WOA','PSO','SCA','SSA','HHO','DA','MFO','GOA','IGWO')
saveas(gcf,'Firstresult.bmp')
save('Research_part_one_variables')