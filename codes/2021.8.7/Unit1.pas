unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, ComObj, MATH, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.GanttCh, VCLTee.TeeProcs, VCLTee.Chart;

type
  my_set = set of 1..255;

  array100 = array[1..100] of Integer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Button8: TButton;
    //DABC
    procedure Button1Click(Sender: TObject);
    procedure DABC_ReCT(); //CT迭代减小函数
    procedure DABC_ReCT1();
    procedure ReadDate();
    procedure DABC_CreateJIEpop(); //初始化解种群
    procedure RandomCreateJie();
    procedure maopao();
    procedure DABC_evaluate(var ind: integer);
    procedure DABC_TP_PMX();  //
    procedure DABC_PMX();    //原文中
    procedure DABC_OX();
    function RouletteWheelSelection(): integer;
    procedure DABC_VNS();
    procedure DABC20set(var scout_number: Integer); //侦察蜂用的随机集合解
    procedure Button2Click(Sender: TObject);
    procedure DABC_decode(var ind: Integer);
    procedure DABC_evaluate_ini(var ind: Integer);
    procedure DABC_decode_up(var ind: Integer);
    procedure Lre_arr_back(var ind: Integer; pzhan: Integer);
    procedure Rre_arr_back(var ind: Integer; pzhan: Integer);
    procedure Lre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Rre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure DABC_re_bestInd(var key: string);
    function choose_direction(var ind: integer; pzhan: Integer): integer;  //返回  -1=左边  1=右边
    procedure Lre_arr_back_1(var ind: Integer; pzhan: Integer);
    procedure Rre_arr_back_1(var ind: Integer; pzhan: Integer);
    function choose_procedure(var ind: Integer; LA: my_set): Integer;
    procedure DABC_bad_MATRIX(var ind: Integer);
    procedure calculation_SI;
    function comp_SI(var ind: Integer): Double;
    procedure SCOUT_LS(var big_ind: Integer);
    //EDA
    procedure EDAModel_initial();
    procedure EDAPopModel_initial();
    procedure EDA_maopao();
    procedure EDA_decode(var ind: Integer); //带快评
    procedure EDA_decode2(var ind: Integer);//不带快评
    procedure EDAModel_update;
    procedure EDAModeL_sample(); //采样EDA生成新种群个体 【与初始种群相似】
    procedure EDA_jiema();
    procedure EDA_jiema_one(var ind: integer);
    procedure EDA_evaluate(var ind: Integer);
    procedure EDA_evaluate2(var ind: integer);
    procedure EDA_evaluate3(var ind: integer); //快评
    procedure EDA_initial_matrix();
    procedure EDA_initial_matrix_2();
    procedure EDA_initial_matrix_3();
    procedure EDA_UPDATE_CT();
    procedure EDA_UPDATE_CT_1();
    procedure Button3Click(Sender: TObject);
    procedure EDA_decode_dir(var ind: integer);
    procedure maopao_samplepop();
    procedure EDA_Relationship_Matrix_initial();
    procedure EDA_Createpop_Intial();
    procedure EDAGetFirstCT();
    procedure EDA_UPdate_Relationship_Matrix();
    procedure EDA_sample();
    procedure EDA_Rand_replace();
    procedure EDA_Set_replace;
    procedure EDA1_sample();   //关键环节验证
    procedure EDA_LS1(); //WUWU        //  LS  中更新历史最优  及CT
    procedure EDA_LS2(); //WUWU        //  LS  中更新历史最优  及CT
    procedure EDA_LS3();
    procedure EDA1_LS1(var ind: Integer); //关键环节验证
    procedure EDA1_LS2(var ind: Integer);
    procedure EDA_Reconstruction_strategy(); //EDA的重构策略
    procedure EDA_CHOOSE_L_P(var ind: Integer; pzhan: Integer);
    procedure EDA_CHOOSE_R_P(var ind: Integer; pzhan: Integer);
    procedure EDA_Refre_Lstation(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure EDA_Refre_Rstation(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure EDA_OX();
    procedure EDA_update_M();
    procedure EDA_update();
   //BAS
    procedure BAS_sample();
    procedure bas_decode(var ind: Integer; DEV: INTEGER);
    procedure BAS_evaluate(var ind: integer);
    procedure BAS_RefreashMartrix(var ind: Integer);
    function BAS_L(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
    function BAS_R(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
    procedure CLEAR();
    procedure BAS_L_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure BAS_R_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure RE_MATRIXandJie(var ind: Integer; p: Integer);
    function BAS_choose_direction(var ind: Integer; pzhan: Integer): integer;  //返回  -1=左边  1=右边
    procedure bad_MATRIX();
    procedure BAS_swap(var ind: Integer);
    procedure Deviation_decode(var ind: Integer; dev: Integer);
    procedure Button6Click(Sender: TObject);

    //对比IG
    procedure mNEH();
    procedure IG_INI_maopao();
    procedure IG_LocalSearch();    //对op做局部搜索
    procedure IG_evaluate(var ind: integer);
    procedure Panel1Click(Sender: TObject);
    procedure Restructure(ind: Integer);  //重构策略
    procedure Restructure_decode(var ind: Integer);   //重构站的解码
    procedure Restructure_evaluate(var ind: Integer);              //重构站的评价
    procedure Reconstruction_process_L(var ind: Integer; pzhan: Integer; TIME_D: Integer);
    procedure Reconstruction_process_R(var ind: Integer; pzhan: Integer; TIME_D: Integer);
    procedure Refactoring_information_update_L(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Refactoring_information_update_R(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Restructure_calculation_new_SI(var ind: Integer);
    procedure SaveParameter_experiment_results(var p: Integer);  //保存参数实验结果

    //对比算法GA
    procedure Crossover(var ind: integer); //变异
    procedure mutation(var ind: integer);
    procedure Button7Click(Sender: TObject);  //交叉
    procedure GA_LS();

    procedure savebestdate();
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  ExcelApp: Variant;

implementation
{$R *.dfm}
//DABC

type
  structure_gongxu = record         //工序特性结构体
    xu: integer;
    zhuangtai: integer;
    fangxiang: integer;
    shijian: integer;
    houxu: array[1..50] of integer; //默认直接后续不超过50
    qianxu: array[1..50] of integer; //直接后续
    wp: double;
    aset: set of 1..255;
    bset: set of 1..255;      //增加前序，后序，紧邻，指标
    anearset: set of 1..250;
    bnearset: set of 1..250;
    anum: Integer;
    bnum: Integer;
    aNearnum: Integer;
    bNearnum: Integer;
    earlytime: Integer;
    totalTime: Integer;
    PL: Double;  //IG  工序的级别值
  end;
type
  structure_jiepop = record           //种群结构体
    CTp: integer;
    IG_indexCT: Integer;
    LSI: Double;
    gongxu: array[1..250] of structure_gongxu; //暂时默认工序不超过100
    DABC_L2:Double;
    Acc_t:Integer;
  end;
var
  jiepop: array[1..400] of structure_jiepop;   //种群规模一百  101存放读取的顺序解的特性
  copyjie: structure_jiepop;
  oldjiepop: array[1..400] of structure_jiepop;
  oldjie: structure_jiepop;
  deepjie: structure_jiepop;
  Copyjiepop: array[1..400] of structure_jiepop;
  Scoutjiepop: array[1..400] of structure_jiepop; //侦察蜂用
  copyoldjiepop: array[1..400] of structure_jiepop;
  Sample_jiepop: array[1..400] of structure_jiepop;
  bestjie: structure_jiepop;
  oldbestjie: structure_jiepop;
  LSjie: structure_jiepop;
  ls1jie: structure_jiepop;
  OperationJie: structure_jiepop;
  OperationJie_best: structure_jiepop;
  OperationJie_copy: structure_jiepop;
  BEST_LSI_jiepop: structure_jiepop;
  best_refactor: structure_jiepop; //保留最好重构
  Backup_process: structure_jiepop;  //备份去除前序的重构站内工序

type
  structure_zhandian = record
    zuoxulie: array[1..200] of integer;
    youxulie: array[1..200] of integer;
    zuoshijian: integer;
    youshijian: integer;
  end;

type
  struture_keixing_zuobianyoubianzhan = record
    zongshijian: integer;
    kexingGongxu: array[1..200] of integer;     //默认一个站最多100个工序
    ZhanCTp: Integer;
    gxEndTime: array[1..200] of Integer;
    gxset: set of 1..255;
    lastx: Integer;  //最近一个工序
  end;

type
  struture_station = record
    FreeTime: Integer;
    OverTime: Integer;
  end;

type
  structure_kexingjiePOP = record
    zuoBianzhan: array[1..20] of struture_keixing_zuobianyoubianzhan;        //默认由最多100个配对站
    youBianzhan: array[1..20] of struture_keixing_zuobianyoubianzhan;
    Station: array[1..100] of struture_station;
    CTp: integer;  //该解的CTp   //由评价函数给出
    PCTp: Double;  //概率
  end;

type
  structure_gongxu_set = record
    aset: set of 1..250;
    bset: set of 1..250;
    anearset: set of 1..250;
    bnearset: set of 1..250;
  end;

var
  EdaFeasibleSolution: array[1..200] of structure_jiepop;
  bestEdaFeasibleSolution: structure_jiepop;
  vns_bestEdaFeasibleSolution: structure_jiepop;
  vns_Solution: structure_jiepop;
  copyEdaFeasibleSolution: array[1..300] of structure_jiepop;
  Local_Matrix: array[0..250] of array[0..250] of double; //0&1   0&非0
  copy_Matrix: array[0..250] of array[0..250] of double; //0&1   0&非0
  stop_Matrix: array[1..250] of array[1..3] of Integer;  //序末端位置矩阵
  copy_stop_Matrix: array[1..250] of array[1..3] of Integer;
  TwoMatrix: array[0..250] of array[0..250] of double; //概率为实数  0作为坐标行列
  init_TwoMatrix: array[0..250] of array[0..250] of double; //概率为实数  0作为坐标行列
  gongxuset: array[1..250] of structure_gongxu_set;
  zhan: struture_keixing_zuobianyoubianzhan;  //更新集合用
  BCT: Integer;
  gx_L, gx_R: Integer; // 记录站上工序的的序号
  code_set: set of 1..255;
  DABC_SI: Double;
  EDA_SI: Double;
  DABC_CT: Integer;
  EDA_CT: Integer;
  bestCTp:Integer;
  Acc_idle_time:Integer;
  Quick_evaluation:Integer;
  deep1,deep2:integer;
  set3:integer; //生成集合的大小
  line_sb,crow_sb:integer;
var
  zhandian: array[1..100] of structure_zhandian;
  n_guimo: integer;             //数据规模
  nm: array100; //配对站点数量
  rand_jie: array[1..250] of structure_gongxu; //随机生成解 //只能表示一个解
  Temporary_storage: structure_gongxu;  //暂存一个工序 插入替换用
  gongxu: structure_gongxu;  //暂存一个工序 插入替换用
  CT: Double;            //可能是各小数
  CM: array[1..100] of Integer;
  indexD: integer;        //最大迭代次数
  iterationMax: Integer;
  IndexA: double;         //均值CM的系数 //初始化CT用一次
  kexingjiepop: array[1..400] of structure_kexingjiePOP;    //默认可行解群体最多102个空间
  copykxjie: structure_kexingjiePOP;
  oldkexingjiepop: array[1..400] of structure_kexingjiePOP;    //默认可行解群体最多102个空间
  oldkxjie: structure_kexingjiePOP;
  copyoldkexingjiepop: array[1..400] of structure_kexingjiePOP;
  Sample_kexingjiepop: array[1..400] of structure_kexingjiePOP;
  vns_kexingjiepop: structure_kexingjiePOP;
  BestKexingjie: structure_kexingjiePOP;
  oldBestKexingjie: structure_kexingjiePOP;
  CurrentKexingjie: structure_kexingjiePOP;
  OperationKexingjie: structure_kexingjiePOP;
  BestOperationKexingjie: structure_kexingjiePOP;
  LSKexingjie: structure_kexingjiePOP;
  ls1kxjie:structure_kexingjiePOP;
  vns_bestkexingjie: structure_kexingjiePOP;
  Copykexingjiepop: array[1..400] of structure_kexingjiePOP; //局部搜之前线做一份保存，评价中比较用到
  scoutkexingjiepop: array[1..400] of structure_kexingjiePOP;
  BEST_LSI_kexingjiepop: structure_kexingjiePOP;
  iteration: integer;
  erro_x: integer;   //解码失败标志  1表不可行
  popsize: integer;  //种群大小【参数】
  yita: double;      //精英解占比【参数】
  aerfa: double;     //学习率【参数】
  indexBack: Integer;
  LCANT: Integer;
  RCANT: Integer;
  zhannumber: Integer;
  BestCT: Double;
  bestind: integer;
  CMean: array[1..20] of double;
  X: Integer;  //矩阵的横轴
  BadMatrix: array[0..250] of array[0..250] of Integer;
  Badset: set of 1..255;
  EDA_Relashion_Matrix: array[0..250] of array[0..250] of double;
  SI: Double;
  oldSI: Double;
  t1, t2: Double;
  CTp: Integer;
  BEST_LSI: Double;
  Number_operations: Integer; //重构站内工序个数
  Refactoring_error: Integer;  //重构错误标志
  subscript: Integer;  //选择的重构站
  insert_times: Integer;  //对历史最优个体做insert次数
  rtime: Integer;
  Total_process_time:Integer; //总工序时间
  Total_idle_time_ind:integer;
  Quick_evaluation_ind:integer;
  Acc_idle_time_ind:integer;
function get_iterationmax(): Integer;
var
  a, b, c: integer;
begin
  case n_guimo of
    9:
      Result := 500;
    12:
      Result := 500;
    16:
      Result := 500;
    65:
      Result := 500;
    148:
      Result := 500;
    205:
      Result := 1000;
  end;
end;
//站内重构策略
//获取更好的LSI

procedure TForm1.Restructure(ind: Integer);
var
  a, b, c, d: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  Partial_sorting: array[1..200] of Integer;  //获取的站内部分排序  对此进行重构
  Difference: Integer;  //站内最大偏差
  first_part_ocess: array[1..300] of Integer; //选择站点之前的工序
  Partial_sorting_SET: set of 1..255;  //站内工序集合
  Original_sort: array[1..300] of Integer;
  rand_pointA, rand_pointB: Integer;  //随机取点做插入
  indcopy: Integer;
begin
  jiepop[198] := jiepop[197]; // 清空
  //计算各个站内SI及差值
  for a := 1 to zhannumber do //计算每个站的实际工作时间
  begin                       //并且记录两边最大实际工作时间
    Light[a] := 0;
    Right[a] := 0;
    b := 1;   //左边
    Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian > Light_max then
      begin
        Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Light[a] := Light[a] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] = 0;
    b := 1;   //右边
    Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian > Right_max then
      begin
        Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Right[a] := Right[a] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[a].kexingGongxu[b] = 0;
  end;
  Difference := Abs(Light[1] - Right[1]);  //获取首个站的差值
  subscript := 1;
  for a := 1 to zhannumber do
  begin
    if Difference < Abs(Light[a] - Right[a]) then
    begin
      Difference := Abs(Light[a] - Right[a]);  //得到最大差值
      subscript := a;     //得到最大站的下标
    end;
  end;

  //对差值最大的站做重构
  //暂不考虑原来排序是怎样的  理论上考虑可能更好   但是不易实现
  for a := 1 to 200 do
  begin
    Partial_sorting[a] := 0;
    Original_sort[a] := 0;
  end;
  a := 1;
  b := 1;
  c := 1;
  repeat
    if (kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a] <> 0) then
    begin
      Partial_sorting[c] := kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a]; //输出排序(左边)
      a := a + 1;
      c := c + 1;
    end;
    if (kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b] <> 0) then
    begin
      Partial_sorting[c] := kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b]; //输出排序(右边)
      b := b + 1;
      c := c + 1;
    end;
  until (kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a] = 0) and (kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b] = 0);
  //站内工序放入集合 用于得到原排序
  Partial_sorting_SET := [];
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      Partial_sorting_SET := Partial_sorting_SET + [Partial_sorting[a]];
    end;
    a := a + 1;
  until Partial_sorting[a] = 0;

  b := 1;
  for a := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[a].xu in Partial_sorting_SET then
    begin
      Original_sort[b] := jiepop[ind].gongxu[a].xu;
      b := b + 1;
    end;
  end;
  //输出该站之前的所有工序
  //将这些工序状态在个体198标记已经安排  并在选择站的工序中剔除前序
  for a := 1 to 200 do
  begin
    first_part_ocess[a] := 0;
  end;
  //开始累计
  c := 1;  //累计工序下标
  for a := 1 to subscript - 1 do
  begin
    b := 1;  //站内工序下标
    d := 1;
    repeat
      if (kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] <> 0) then
      begin
        first_part_ocess[c] := kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]; //输出排序(左边)
        b := b + 1;
        c := c + 1;
      end;
      if (kexingjiepop[ind].youBianzhan[a].kexingGongxu[d] <> 0) then
      begin
        first_part_ocess[c] := kexingjiepop[ind].youBianzhan[a].kexingGongxu[d]; //输出排序(右边)
        d := d + 1;
        c := c + 1;
      end;
    until (kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] = 0) and (kexingjiepop[ind].youBianzhan[a].kexingGongxu[d] = 0);
  end;
  //计算选择站的工序个数
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      a := a + 1;
    end;
  until Partial_sorting[a] = 0;
  Number_operations := a - 1;
  if Number_operations > 2 then //如果工序数目大于2  才有重构的意义
  begin
    //将工序给出解码评价
    a := 1;
    repeat
      jiepop[198].gongxu[a] := jiepop[199].gongxu[Original_sort[a]]; //给出排序，并赋予性质
      a := a + 1;
    until Original_sort[a] = 0;
    indcopy := ind;  //暂存
    //对这些工序性质处理
    ind := 198;
    for b := 1 to Number_operations do              //紧邻后序的前序集合中剔除该前序
    begin
      a := 1;
      repeat
        if first_part_ocess[a] in jiepop[ind].gongxu[b].aset then
        begin
          jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [first_part_ocess[a]];
        end;
        a := a + 1;
      until first_part_ocess[a] = 0;
    end;
    Backup_process := jiepop[198]; //备份 用于还原性质

    Restructure_decode(ind);  //
    Restructure_evaluate(ind);  //评价SI
    best_refactor := jiepop[198]; //保留最好重构
    for a := 1 to 100 do  //重构十次  取最好方案
    begin
      rand_pointA := 1;
      rand_pointB := 1;
      while (rand_pointA = rand_pointB) do   //随机取不同点做插入
      begin
        rand_pointA := RandomRange(1, Number_operations + 1);
        rand_pointB := RandomRange(1, Number_operations + 1);
      end;
      Temporary_storage := jiepop[ind].gongxu[rand_pointA];
      jiepop[ind].gongxu[rand_pointA] := jiepop[ind].gongxu[rand_pointB];
      jiepop[ind].gongxu[rand_pointB] := Temporary_storage;

      Restructure_decode(ind);  //必须给节拍限制  解码规则按照前m-1个操作
      if Refactoring_error = 1 then    //重构错误
      begin
        jiepop[198] := best_refactor; //还原
      end
      else if Refactoring_error = 0 then  //重构满足CT  成功一半
      begin
        Restructure_evaluate(ind);  //评价SI 并取舍解
        if jiepop[ind].LSI < best_refactor.LSI then
        begin
          best_refactor := jiepop[ind];  //更新好的SI方案
          ind := indcopy;
          kexingjiepop[ind].zuoBianzhan[subscript] := Kexingjiepop[198].zuoBianzhan[1];
          kexingjiepop[ind].youBianzhan[subscript] := Kexingjiepop[198].youBianzhan[1];
          //计算新的SI值
          DABC_evaluate(ind); //
          if jiepop[ind].LSI < oldjiepop[ind].LSI then
          begin
            c := 1;
          end;
       //   Restructure_calculation_new_SI(ind);


        end;
      end;
    end;
  end;
end;
//计算重构后的新SI CT

procedure TForm1.Restructure_calculation_new_SI(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if A <> subscript then
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end
    else if A = subscript then
    begin
      if (kexingjiepop[198].zuobianzhan[1].zongshijian >= kexingjiepop[198].youbianzhan[1].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //*********
  if (iteration > 0) and (kexingjiepop[ind].CTp = oldkexingjiepop[ind].CTp) then
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//权重结果越小越好
    begin                       //但站的节拍存放到左边站里面的，直接覆盖左边
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    if compare2 < compare1 then  //原来的解更好则，换回去
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //新解更好  备份old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else if (iteration > 0) and (oldkexingjiepop[ind].CTp < kexingjiepop[ind].CTp) then  //换回去
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //新解更好  备份old
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;
  //利用站内实际工作时间作为目标再平衡 //计算平滑指数SI
  for A := 1 to zhannumber do //计算每个站的实际工作时间
  begin
    if A <> subscript then
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //左边
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //右边
      Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end
    end
    else if A = subscript then
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //左边
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[198].zuoBianzhan[1].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[198].zuoBianzhan[1].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //右边
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[198].youBianzhan[1].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[198].youBianzhan[1].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end
    end;
  end;

  MAX_T := Max(Light_max, Right_max);    // bug
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  if jiepop[ind].LSI < oldjiepop[ind].LSI then
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind].zuoBianzhan[subscript] := kexingjiepop[198].zuoBianzhan[1];
    oldkexingjiepop[ind].youBianzhan[subscript] := kexingjiepop[198].youBianzhan[1];
  end;
  //计算SI 结束
end;

procedure TForm1.SCOUT_LS(var big_ind: Integer);
var
  flag1, flag2: array[1..200] of integer;
  a: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1: set of 1..255;
  lab2: integer;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := big_ind;
    s2 := RandomRange(1, popsize + 1);
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //选交叉位置
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //调整s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //将父代1的不变片段  放入集合 用做父代2的判断
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //夫2的遍历下标
  for a := 1 to (p1 - 1) do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  DABC_decode(s1);
  DABC_evaluate(s1);
  if jiepop[s1].CTp <= CT then
  begin
    CT := jiepop[s1].CTp - 1;
  end;
end;
//DABC算法

procedure TForm1.Button1Click(Sender: TObject);
var
  a, d, c, pop: integer;
  B: integer;                    //CM[B] 循环提取CM
  select: Integer;
  Lorder, Rorder: string;
  small_ind: Integer;  //放弃的个体数目
  big_ind: Integer;
  minT, maxT: Integer;
  CopyCT: Integer;
  yuanshixu: string;
  ind: Integer;
  b_num: Integer;
  num: Integer;
  key: string;
  crow, times, line: Integer;
  COCT: Double;
  code_set: set of 1..255;
  scout_number: Integer;
label
  2, 3;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
 // for times := 1 to 10 do
  begin
    line := 1;
    b_num := 2;  //更换站测试集
  //  repeat
      ReadDate();
      IndexA := 1.5;
      small_ind := 1;  //放弃个体数目【参数】
      big_ind := 0;
      d := 0;
      minT := 0;  //侦察蜂用找最好最坏的个体
      maxT := 0;
      popsize := 160;  //【参数：种群规模】
      scout_number := 150;
      //更换站点数据后初始化
      code_set := [];
      t1 := GetTickCount;  //开始时间
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := 1.2 * BCT;
      iteration := 0;        //初始化迭代数为0
      DABC_CreateJIEpop();      //启发式规则生成初始解
      for ind := 1 to popsize do //解码评价
      begin
        DABC_decode(ind);
        DABC_evaluate_ini(ind);   //不带选择的直接评价
        oldjiepop[ind] := jiepop[ind]; //选择评价用到
        oldkexingjiepop[ind] := kexingjiepop[ind];
        if ind=1 then
        begin
          bestCTp:=jiepop[1].CTp;
          bestind := ind;
          DABC_SI := jiepop[bestind].LSI;
          DABC_CT := jiepop[bestind].CTp;
        end;
        if jiepop[ind].CTp < bestCTp then
        begin
          bestCTp:=jiepop[ind].CTp;
          bestind := ind;
          DABC_SI := jiepop[bestind].LSI;
          DABC_CT := jiepop[bestind].CTp;
        end;
      end;
      CT:= bestCTp-1;
      //开始蜂群迭代
      repeat
        iteration := iteration + 1;
        for ind := 1 to (popsize div 2) do //【雇佣蜂阶段】
        begin
          DABC_OX();
        end;
        for ind := 1 to popsize do //【旁观蜂阶段】
        begin
          DABC_VNS();
        end;
        begin//【侦察蜂阶段】         1.替代重复的个体  2.没有重复则替代最差的个体
          DABC20Set(scout_number);     //随机生成
          for ind := 1 to scout_number do  //备份空间 【不确定参数：20】
          begin
            Copyjiepop[ind] := jiepop[ind];
            Copykexingjiepop[ind] := kexingjiepop[ind];
            copyoldjiepop[ind] := oldjiepop[ind];
            copyoldkexingjiepop[ind] := oldkexingjiepop[ind];
          end;
          for ind := 1 to scout_number do
          begin
            jiepop[ind] := Scoutjiepop[ind];
          end;
          iteration := 0;  //不带选择的直接评价
          CT:=bestCTp; //用最好节拍取生成
          for ind := 1 to scout_number do   //对这20个解解码
          begin
            DABC_decode(ind);
            DABC_evaluate(ind);
          end;
          CT:=bestCTp-1;
          minT := jiepop[1].CTp;
          small_ind := 1;
          for d := 1 to scout_number do
          begin
            if jiepop[d].CTp < minT then
            begin
              minT := jiepop[d].CTp;
              small_ind := d;
            end
          end;                   //找到集合中最好的个体
          Scoutjiepop[1] := jiepop[small_ind];
          scoutkexingjiepop[1] := kexingjiepop[small_ind];
          for a := 1 to scout_number do  //还原空间
          begin
            jiepop[a] := copyjiepop[a];
            kexingjiepop[a] := Copykexingjiepop[a];
            oldjiepop[a] := copyoldjiepop[a];
            oldkexingjiepop[a] := copyoldkexingjiepop[a];
          end;
          begin     //找到重复的一个  [有效]
            for a := 1 to popsize do //跟后边的对比 //相当于一个冒泡算法  但是不需要走完
            begin
              for B := a + 1 to popsize do
              begin
                for c := 1 to n_guimo do
                begin
                  if jiepop[a].gongxu[c].xu <> jiepop[B].gongxu[c].xu then
                    goto 2;
                end;
                if c = n_guimo + 1 then  //说明全部工序相等  重复了
                begin
                  code_set := code_set + [a];
                  jiepop[a] := Scoutjiepop[1];
                  oldjiepop[a] := Scoutjiepop[1];
                  kexingjiepop[a] := scoutkexingjiepop[1];  //【替换个体】
                  oldkexingjiepop[a] := scoutkexingjiepop[1];
                  big_ind := a;
                  goto 3;
                end;
                2: //方案不重复直接跳出
              end;
            end;
            begin     //如果没有重复方案则找种群中最差个体
              maxT := jiepop[1].CTp;
              big_ind := 1;
              for d := 1 to popsize do
              begin
                if jiepop[d].CTp > maxT then
                begin
                  maxT := jiepop[d].CTp;
                  big_ind := d;
                end
              end;    //jiepop[index2] 是种群中最差的个体
              code_set := code_set + [big_ind];
              jiepop[big_ind] := Scoutjiepop[1];
              oldjiepop[big_ind] := Scoutjiepop[1];
              kexingjiepop[big_ind] := scoutkexingjiepop[1];  //【替换个体】
              oldkexingjiepop[big_ind] := scoutkexingjiepop[1];
            end;
            3: //有重复方案直接跳出
          end;
        end;
        memo1.lines.add(inttostr(bestCTp));
        t2 := GetTickCount; //检测时间
      until (t2 - t1) > (n_guimo * n_guimo * 15);  //达到最大迭代次数
     { Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[c]=0)and(kexingjiepop[bestind].youBianzhan[a].kexingGongxu[c]=0) ;
        if kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  空  ';
        end;
        Lorder:=Lorder+'  |  ';
        if kexingjiepop[bestind].youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(kexingjiepop[bestind].youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  空  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      //输出原始解的序
      yuanshixu:='';
      for a := 1 to n_guimo do
      begin
        yuanshixu:=yuanshixu+inttostr(jiepop[bestind].gongxu[a].xu)+',';
      end;
      Memo1.Lines.Add('实际迭代数：'+inttostr(iteration));
      Memo1.Lines.Add('工序规模：'+inttostr(n_guimo));
      Memo1.Lines.Add('工位规模：'+inttostr(Nm[B_num]));
      Memo1.Lines.Add('最优节拍：'+FloatToStr(bestCT));
      Memo1.Lines.Add('左边站方案：'+Lorder);
      Memo1.Lines.Add('右边站方案：'+Rorder);
      Memo1.Lines.Add('原始序：'+yuanshixu);
      Memo1.Lines.Add('best_CT_LSI：'+FloatToStr(JIEPOP[bestind].LSI));
      Memo1.Lines.Add('best_LSI：'+FloatToStr(BEST_LSI));
      Memo1.Lines.Add('              ');    }
      Memo1.Lines.Add('decode：'+IntToStr(rtime));
      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(DABC_CT);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(DABC_SI);
      line := line + 1;
      b_num := b_num + 1;  //本站点数测试集结束  //换下一个
      FillChar(jiepop, SizeOf(jiepop), 0);
      FillChar(oldjiepop, SizeOf(oldjiepop), 0);
      FillChar(copyjiepop, SizeOf(jiepop), 0);
      FillChar(oldkexingjiepop, SizeOf(oldkexingjiepop), 0);
      FillChar(Copykexingjiepop, SizeOf(kexingjiepop), 0);
 //   until (Nm[b_num] = 0);
    crow := crow + 2;
    CLEAR();
  end;
  ExcelApp.Activeteworkbook.save;
end;

procedure TForm1.CLEAR();
var
  a: Integer;
begin
  FillChar(jiepop, SizeOf(jiepop), 0);
  FillChar(copyjiepop, SizeOf(jiepop), 0);
  FillChar(kexingjiepop, SizeOf(kexingjiepop), 0);
  FillChar(Copykexingjiepop, SizeOf(kexingjiepop), 0);
  fillchar(nm, SizeOf(nm), 0);
end;

procedure TForm1.EDA_Relationship_Matrix_initial();
var
  a, b, c: Integer;
begin
  for a := 1 to n_guimo do        //横纵轴
  begin
    EDA_Relashion_Matrix[0, a] := a;
    EDA_Relashion_Matrix[a, 0] := a;
  end;
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      EDA_Relashion_Matrix[a, b] := 0.1;  //剩下位置会利用选择矩阵扣成0；
    end;
end;

procedure TForm1.EDAGetFirstCT();
var
  ind: Integer;
  DEV: Integer;
begin
  ind := 300;
  DEV := 10000;
  repeat
    jiepop[300] := jiepop[299];  //复原
    kexingjiepop[300] := kexingjiepop[299]; //空
    CT := CT + 1;
    bas_decode(ind, DEV);
    BAS_evaluate(ind);
    bad_MATRIX();
 //     memo1.lines.add(inttostr(kexingjiepop[IND].CTp));
  until jiepop[300].CTp <= ct;
  jiepop[1] := jiepop[300];      //第一个解
  kexingjiepop[1] := kexingjiepop[300];
  jiepop[300] := jiepop[299];  //复原
  kexingjiepop[300] := kexingjiepop[299];
end;
//创建EDA的关系矩阵  谁在谁后边  是一个概率矩阵

procedure TForm1.EDA_UPdate_Relationship_Matrix();
var
  a, b, x, y: Integer;
  add: array[1..250] of array[1..250] of Integer;
  ind: Integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      add[a, b] := 0;
    end;           //  trunc(yita*popsize)+1
  for ind := 1 to Trunc(yita * popsize) do
  begin
    for a := 1 to n_guimo - 1 do
    begin
      add[jiepop[ind].gongxu[a].xu, jiepop[ind].gongxu[a + 1].xu] := add[jiepop[ind].gongxu[a].xu, jiepop[ind].gongxu[a + 1].xu] + 1;
    end;
  end;         //代代累计概率值
  for x := 1 to n_guimo do        //local_matrix[x,y]:=TRUNC(((1-aerfa)*local_matrix[x,y]+(aerfa/30)*add[x,y])*1000)/1000;
  begin
    for y := 1 to n_guimo do
    begin
      EDA_Relashion_Matrix[x, y] := TRUNC(((1 - aerfa) * EDA_Relashion_Matrix[x, y] + (aerfa / (yita * popsize)) * add[x, y]) * 1000) / 1000;
    end;
  end;
end;
//EDA重构策略减小LSI
//重构对象：bestjie
//输出对象：bestjie 拥有更好的LSI

procedure TForm1.EDA_Reconstruction_strategy();
var
  a, b, c, d: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  Partial_sorting: array[1..200] of Integer;  //获取的站内部分排序  对此进行重构
  Difference: Integer;  //站内最大偏差
  first_part_ocess: array[1..300] of Integer; //选择站点之前的工序
  Partial_sorting_SET: set of 1..255;  //站内工序集合
  Original_sort: array[1..300] of Integer;
  rand_pointA, rand_pointB: Integer;  //随机取点做插入
  indcopy: Integer;
  sta: Integer;   //需要重构的站
  ind: Integer;
  num: Integer;
  op: Integer;
  Insertop: Integer;  //提取点
  Insertop2: Integer; //插入点
  times: Integer;
label 1;
begin
  //计算出最大劳动时间站差的站位置
  //从该位置起重构改方案
  //重复1次
  //计算各个站内SI及差值
  for a := 1 to zhannumber do //计算每个站的实际工作时间
  begin                       //并且记录两边最大实际工作时间
    Light[a] := 0;
    Right[a] := 0;
    b := 1;   //左边
    Light_max := bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian > Light_max then
      begin
        Light_max := bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Light[a] := Light[a] + bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until BestKexingjie.zuoBianzhan[a].kexingGongxu[b] = 0;
    b := 1;   //右边
    Right_max := bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian > Right_max then
      begin
        Right_max := bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Right[a] := Right[a] + bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until BestKexingjie.youBianzhan[a].kexingGongxu[b] = 0;
  end;

  Difference := Abs(Light[1] - Right[1]);  //获取首个站的差值
  subscript := 1;
  for a := 1 to zhannumber do
  begin
    if Difference < Abs(Light[a] - Right[a]) then
    begin
      Difference := Abs(Light[a] - Right[a]);  //得到最大差值
      subscript := a;     //得到最大站的下标
    end;
  end;

  //从最大差值的站开始重构后边部分
  //前面已安排工序
  //后边未安排工序
  for a := 1 to 200 do
  begin
    Partial_sorting[a] := 0; //后边剩余工序
    Original_sort[a] := 0;   //前面已安排工序
  end;
  a := 1;
  b := 1;
  c := 1;
  for sta := subscript to zhannumber do  //所有需要重构的站及工序
  begin
    repeat
      if (BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a] <> 0) then
      begin
        Partial_sorting[c] := BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a]; //输出排序(左边)
        a := a + 1;
        c := c + 1;
      end;
      if (BestKexingjie.youBianzhan[subscript].kexingGongxu[b] <> 0) then
      begin
        Partial_sorting[c] := BestKexingjie.youBianzhan[subscript].kexingGongxu[b]; //输出排序(右边)
        b := b + 1;
        c := c + 1;
      end;
    until (BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a] = 0) and (BestKexingjie.youBianzhan[subscript].kexingGongxu[b] = 0);
  end;
  //站内工序放入集合 用于得到原排序
  Partial_sorting_SET := [];
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      Partial_sorting_SET := Partial_sorting_SET + [Partial_sorting[a]];
    end;
    a := a + 1;
  until Partial_sorting[a] = 0;
  b := 1;
  for a := 1 to n_guimo do
  begin
    if bestjie.gongxu[a].xu in Partial_sorting_SET then
    begin
      Original_sort[b] := bestjie.gongxu[a].xu;
      b := b + 1;
    end;
  end;
  a := 0;
  repeat
    a := a + 1;
  until Original_sort[a] = 0;
  num := a - 1;

  for times := 1 to zhannumber do   //重构次数=站点数目
  begin
    //开始做向后插入
    oldbestjie := bestjie; //备份最好解
    oldbestkexingjie := BestKexingjie;
    op := RandomRange(1, num);
    a := 0;
    repeat
      a := a + 1;
    until bestjie.gongxu[a].xu = op;
    Insertop := a; //提取点  //向后插入
    Insertop2 := RandomRange(Insertop, n_guimo); //插入点
    jiepop[300].gongxu[1] := bestjie.gongxu[Insertop]; //存一下提取点;
    for a := Insertop + 1 to Insertop2 do    //移动片段
    begin
      bestjie.gongxu[a - 1] := bestjie.gongxu[a];
    end;
    bestjie.gongxu[Insertop2] := jiepop[300].gongxu[1]; //插入

    oldjiepop[194] := bestjie;
    oldkexingjiepop[194] := BestKexingjie;
    jiepop[194] := bestjie;
    kexingjiepop[194]:= BestKexingjie;
    a := 194;

    CT:=BESTJIE.CTP;
    EDA_decode(a);           //快评
    EDA_evaluate3(a); //带贪婪的评价  快评
    CT:=BESTJIE.CTP-1;

    if (jiepop[194].CTp < bestjie.CTp) then
    begin
      if jiepop[194].CTp < bestjie.CTp then
      begin
        CT := jiepop[194].CTp - 1;
        bestjie := jiepop[194];               //更新
        BestKexingjie := kexingjiepop[194];
        EDA_CT := bestjie.CTp;
        EDA_SI := bestjie.LSI;
        EDA_update_M;
          //    savebestdate();
        Memo1.Lines.Add('重构 FIND:' + IntToStr(EDA_CT));
        Memo1.Lines.Add('重构 FIND:' + FloatToStr(EDA_SI));
        GOTO 1;
      end
    end
    else
    if (jiepop[194].CTp = bestjie.CTp) and (jiepop[194].LSI < bestjie.LSI) then
    begin
      bestjie := jiepop[194];               //更新
      BestKexingjie := kexingjiepop[194];
      EDA_CT := bestjie.CTp;
      EDA_SI := bestjie.LSI;
      EDA_update_M;
         //   savebestdate();
      Memo1.Lines.Add('重构 FIND_SI:' + FloatToStr(EDA_SI));
      GOTO 1;
    end
    else
    begin
      bestjie := oldbestjie;     //复原
      BestKexingjie := oldbestkexingjie;
    end;
  end;
 1:
end;

//EDA算法
procedure TForm1.Button2Click(Sender: TObject);
var
  bestCTp: Integer;
  a, b, c, d: Integer;
  b_num: integer; //站数目下标
  t1, t2: Double;
  ind: integer;
  p: integer; //测试
  bestgongxu: string;
  num: Integer;
  Lorder, Rorder, yuanshixu: string;
  itera: Integer;
  choose: Integer;  //参数组合
  PTEXT: Integer;
  times: Integer;
  line, crow: Integer;  //输出到外部表格
  cop: Double;  //保存最优个体节拍
  copy1:Integer;
  combination:Integer; //参数组合类型
  deep3:integer;
  paramter_exp: integer;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;

  crow := 1;
  for paramter_exp := 1 to 16 do  //参数实验组数 16组
  begin
    line := 1;   //保存为第一行数据
    popsize := 100; //[参数]
    deep2 := 20;
//    area := 0.1;    //[参数]
    for times := 1 to 10 do      //每组参数实验进行5次
    begin
      Readdate();       //载入数据集
      b_num := 1;

      t1 := gettickcount();

      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      set3:=(300+(trunc(n_guimo /3)+1));
      iteration := 0; //必须在评价初始解前面
      EDAGetFirstCT();

      EDA_Createpop_Intial();   //初始化种群   1+29+70
      EDA_maopao();   //浪费时间
      bestjie := jiepop[1];
      bestkexingjie:=kexingjiepop[1];
      CT := bestjie.CTp - 1;
      repeat        //开始计时
        copy1:=bestjie.CTp;
        iteration := iteration + 1;
        //更新概率模型(精英选择，参数)
//        EDA_update;
        //采样生成新种群
//        EDA_sample;
        //局部搜索的d-insert操作
        EDA_LS3();
        //局部搜索的重构策略
        if copy1 = bestjie.CTp then   //只有方案不变化才重构
        begin
          EDA_Reconstruction_strategy();  //对个体的重构搜索
        end;
        memo1.Lines.Add(inttostr(bestjie.CTp));
        t2 := gettickcount();
      until (t2 - t1) > (n_guimo * n_guimo * 3); //卡时间停止
      Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (bestkexingjie.zuoBianzhan[a].kexingGongxu[c]=0)and(bestkexingjie.youBianzhan[a].kexingGongxu[c]=0) ;
        if bestkexingjie.zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(bestkexingjie.zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  空  ';
        end;
        Lorder:=Lorder+'  |  ';
        if bestkexingjie.youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(bestkexingjie.youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  空  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      Memo1.Lines.Add('工序规模：'+inttostr(n_guimo));
      Memo1.Lines.Add('工位规模：'+inttostr(Nm[B_num]));
      Memo1.Lines.Add('左边站方案：'+Lorder);
      Memo1.Lines.Add('右边站方案：'+Rorder);
      Memo1.Lines.Add('CT：'+FloatToStr(bestjie.CTp));
      Memo1.Lines.Add('SI：'+FloatToStr(bestjie.LSI));
      Memo1.Lines.Add('              ');

      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(BESTJIE.CTP);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(BESTJIE.LSI);

      line := line + 1;
      CLEAR();
    end;
    crow := crow + 2;
  end;
end;

procedure TForm1.saveParameter_experiment_results(var p: Integer);
var
  ExcelApp: Variant;
  a, b, c, d, e: integer;
  total: integer;
  maxT: Integer;
  p_stop: Integer; //末端位置
  TM: array[1..20] of integer; //理想均值时间
  L_Time, R_Time: integer;
  L_M_time, R_M_time: array[1..20] of integer; //左右边时间下界
begin
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('E:\SaveParameter_experiment_results' + '.xls');
  ExcelApp.WorkSheets[1].Activate;

  ExcelApp.Cells[p, 1].Value := bestjie.CTp;
  // 关闭工作簿：
//  ExcelApp.WorkBooks.Close ;
  //退出 Excel：
//  ExcelApp.Quit;
//  memo1.Lines.Add('导入完毕！')
end;
//CT更新

procedure TForm1.EDA_UPDATE_CT();
begin
  if CT >= bestEdaFeasibleSolution.ctp then
  begin
    CT := bestEdaFeasibleSolution.ctp - 1;
    memo1.lines.add(FloatToStr(bestEdaFeasibleSolution.ctp));
  end;
end;
//

procedure TForm1.EDA_UPDATE_CT_1();
begin
  if CT >= EdaFeasibleSolution[1].ctp then
  begin
    CT := CT - 1;
  end;
end;
//GA交叉
//OX顺序交叉

procedure TForm1.Crossover(var ind: integer);
var
  flag1, flag2: array[1..200] of integer;
  a,b: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1: set of 1..255;
  lab2: integer;
  label 1;
begin
  s1:=ind;
  s2:=s1;
  while s1=s2 do
  begin
    randomize ;
    s2:=RandomRange(1,popsize) ;
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //选交叉位置
  begin
    randomize ;
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //调整s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //将父代1的不变片段  放入集合 用做父代2的判断
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //夫2的遍历下标
  for a := 1 to (p1 - 1) do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  EDA_decode2(s1);
  EDA_evaluate2(s1);
  if (jiepop[s1].CTp < bestjie.CTp)OR ((jiepop[s1].CTp = bestjie.CTp)AND(jiepop[s1].LSI < bestjie.LSI) )then //更新CT
  begin
  //  Memo1.Lines.Add('CROSSOVER ：CT  ' + inttostr(jiepop[s1].CTp)+' IND '+IntToStr(s1)+'  SI: '+floatTOSTR(bestjie.LSI));
    if (jiepop[s1].CTp < bestjie.CTp) then
    begin
      CT := bestjie.CTp - 1;
  //    memo1.lines.add(' CROSS  CT  '+INTTOSTR(BESTJIE.CTP)+'SI '+FLOATTOSTR(BESTJIE.LSI) );
    end;
    bestjie:=jiepop[s1];;
    bestkexingjie:=kexingjiepop[s1];
  end

end;
//GA变异
//单点
procedure TForm1.mutation(var ind: integer);
var
  rand_a,rand_b:integer;
  a,b,c:integer;
begin
  rand_a:=1;
  rand_b:=1;
  while rand_a=rand_b do
  begin
    rand_a:=randomrange(1,n_guimo);
    rand_b:=randomrange(1,n_guimo);
  end;
  if rand_a>rand_b then   //调整rand_a<rand_b
  begin
    a:=rand_a;
    rand_a:=rand_b;
    rand_b:=a;
  end;
  gongxu:=jiepop[ind].gongxu[rand_a];
  for a := rand_a to rand_b-1 do
  begin
    jiepop[ind].gongxu[a]:=jiepop[ind].gongxu[a+1];
  end;
  jiepop[ind].gongxu[rand_b]:=gongxu;
  dabc_decode(ind);
  EDA_evaluate(ind);  //直评
end;
//GA  insert
procedure TForm1.GA_LS();
var
  rand_a,rand_b:integer;
  a,b,c:integer;
  t:integer;
  ind:integer;
begin
  for t := 1 to n_guimo do
  begin
    CT:=bestjie.CTp-1;
    JIEPOP[300]:=BESTJIE;
    OLDJIEPOP[300]:=BESTJIE;
    kexingjiepop[300]:=bestkexingjie;
    oldkexingjiepop[300]:=bestkexingjie;
    ind:=300;
    rand_a:=1;
    rand_b:=1;
    while rand_a=rand_b do
    begin
      rand_a:=randomrange(1,n_guimo);
      rand_b:=randomrange(1,n_guimo);
    end;
    if rand_a>rand_b then   //调整rand_a<rand_b
    begin
      a:=rand_a;
      rand_a:=rand_b;
      rand_b:=a;
    end;
    gongxu:=jiepop[ind].gongxu[rand_a];
    for a := rand_a to rand_b-1 do
    begin
      jiepop[ind].gongxu[a]:=jiepop[ind].gongxu[a+1];
    end;
    jiepop[ind].gongxu[rand_b]:=gongxu;
    EDA_decode2(ind);
    EDA_evaluate2(ind);
    if (jiepop[ind].CTp<bestjie.CTp) then
    begin
      bestjie:=jiepop[ind];
      bestkexingjie:=kexingjiepop[ind];
      CT:=bestjie.CTp-1;
   //   memo1.Lines.Add('GA_LS :CT  '+intTostr(BESTJIE.CTp)  );
    end;
  end;
end;
//对比算法NGA
//对GA 做改进

procedure TForm1.Button3Click(Sender: TObject);
var
  a, d, c, pop: integer;
  B: integer;                    //CM[B] 循环提取CM
  select: Integer;
  Lorder, Rorder: string;
  small_ind: Integer;  //放弃的个体数目
  big_ind: Integer;
  minT, maxT: Integer;
  CopyCT: Integer;
  yuanshixu: string;
  ind: Integer;
  b_num: Integer;
  num: Integer;
  key: string;
  CME: Double;
  crow ,times ,line:integer;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;

  crow := 1;
 // for times := 1 to 20 do
  begin
    line:=1;
    readDate();
    iterationMax := get_iterationmax();
    IndexA := 1.2;  //
    small_ind := 1;  //放弃个体数目【参数】
    big_ind := 0;
    d := 0;
    minT := 0;
    maxT := 0;
    b_num := 2;  //更换站测试集
    popsize := 160;  //【参数：种群规模】
  //  repeat
      //更换站点数据后初始化
      t1 := GetTickCount;  //开始时间
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CME := CMean[b_num];
      CT:=BCT;
      EDAGetFirstCT();
      iteration := 0;        //初始化迭代数为0
      DABC_CreateJIEpop();   //启发式规则生成初始解
      for ind := 1 to popsize do //解码评价
      begin
        DABC_decode(ind);
        EDA_evaluate(ind);
      end;
      bestjie := jiepop[1]; //并不是最好的，不过没关系
      CT:=bestjie.CTp-1;
      //开始GA迭代
      repeat
        iteration := iteration + 1;  //迭代数递增
        for ind := 1 to popsize do    //对每次交叉个体都评价
        begin
          if randomrange(1,10)>1 then   //交叉概率90%
          begin
            Crossover(ind);
          end;
        end;
        for ind := 1 to popsize do
        begin
          if randomrange(1,10)>8 then  //变异概率10%
          begin
            mutation(ind);
          end;
        end;
        GA_LS();
        MEMO1.lines.add(inttostr(bestjie.ctp));
        t2 := GetTickCount; //检测时间
//        memo1.lines.add('iteration '+INTTOSTR(ITERATION)+' CT  '+INTTOSTR(BESTJIE.CTP)+'SI '+FLOATTOSTR(BESTJIE.LSI) );
      until (t2 - t1) > (n_guimo * n_guimo * 15);  //达到最大迭代次数
  //    Memo1.Lines.Add('解码次数：' + IntToStr(rtime));
      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(bestjie.CTp);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
    //  b_num := b_num + 1;  //本站点数测试集结束  //换下一个
  //  until (Nm[b_num] = 0);

    crow := crow + 2;
    CLEAR();
  end;
end;

//IG 初始化方式
procedure TForm1.mNEH();
var
  ind: Integer;
  a, b, c: Integer;
begin
  ind := 200; //利用200的数据创建初始
  for a := 1 to n_guimo do  //每个工序紧邻后序的时间之和
  begin
    b := 0;
    repeat
      b := b + 1;
      if jiepop[200].gongxu[a].houxu[b] <> 0 then
      begin
        jiepop[200].gongxu[a].totalTime := jiepop[200].gongxu[a].totalTime + jiepop[200].gongxu[jiepop[200].gongxu[a].houxu[b]].shijian;
      end;
    until jiepop[200].gongxu[a].houxu[b] = 0;
  end;
  for a := 1 to n_guimo do    //每个工序紧邻后序的时间+自己的时间之和
  begin
    jiepop[200].gongxu[a].totalTime := jiepop[200].gongxu[a].totalTime + jiepop[200].gongxu[a].shijian;
  end;
  IG_INI_maopao();     //降序排序
  for a := 1 to n_guimo do
  begin
    jiepop[200].gongxu[a].PL := 1 - (2 * a - 1) / (2 * n_guimo);
  end;
  //得到RPW 排序
  //利用NEH调整排序  [空缺]

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

//降序
procedure TForm1.IG_INI_maopao();
var
  i, j, k: integer;
  temp: structure_gongxu;
begin
  for i := (n_guimo - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                          //降序
      if jiepop[200].gongxu[j].totalTime < jiepop[200].gongxu[j + 1].totalTime then
      begin
        temp := jiepop[200].gongxu[j];
        jiepop[200].gongxu[j] := jiepop[200].gongxu[j + 1];
        jiepop[200].gongxu[j + 1] := temp;
      end;
    end;
  end;
end;

procedure TForm1.IG_LocalSearch();    //对op做局部搜索
var
  counter: Integer;
  i: integer;
  j: Integer;
  a: Integer;
  setA: set of 1..255;
  b: Integer;
  ind: Integer;
  ceshi: Integer;
  LScount:integer;
label
  1;

begin
  lscount:=0;
  counter := 0;
 // i := 1;        //i提取位置
  while( counter <n_guimo)do
  begin
   i:=randomrange(1,n_guimo);
   j:=randomrange(1,n_guimo);
  //  for j := 1 to n_guimo do   //j插入位置
    begin
      ls1jie := lsjie; //清空
      ls1kxjie:=lskexingjie;
      oldjiepop[1]:=ls1jie;
      oldkexingjiepop[1]:= ls1kxjie ;
   //  if (i<j)and (not(lsjie.gongxu[i].xu in lsjie.gongxu[j].aset)) then
      if (i<j) THEN
      begin
        ls1jie.gongxu[j] := lsjie.gongxu[i];  //插入产生新解
        for a := i + 1 to j do
        begin
          ls1jie.gongxu[a - 1] := lsjie.gongxu[a];
        end;
      end
      else
    //  if (i>j)and (not(lsjie.gongxu[j].xu in lsjie.gongxu[i].aset))then
      if (i>j) THEN
      begin
        ls1jie.gongxu[j] := lsjie.gongxu[i];  //插入产生新解
        for a := i - 1 downto j do
        begin
          ls1jie.gongxu[a + 1] := lsjie.gongxu[a];
        end;
      end
      else
      begin
        goto 1;
      end;
      jiepop[1] := ls1jie; //给入
      ind := 1;
      LScount:=LScount+1;
      EDA_decode2(ind);
      eda_evaluate2(ind);
     // IG_evaluate(ind);
      ls1jie := jiepop[1]; //给出
      LS1Kxjie := kexingjiepop[1];
      if ls1jie.CTp < LSjie.CTp then
      begin
        lsjie := ls1jie;
        LSKexingjie:= LS1Kxjie;
        counter := 0;  // 重新计数
     //   memo1.lines.add('LS更新:  '+inttostr(LSjie.CTp));
        if LSjie.ctp<=CT then
        begin
          CT:= LSjie.ctp-1;
      //    memo1.lines.add('LS更新:  '+inttostr(LSjie.CTp));
        end;
      end
      else if ls1jie.CTp = LSjie.CTp then
      begin
        lsjie := ls1jie;  //未优化  继续计数
        LSKexingjie:= LS1Kxjie;
      end; 
1:   //说明不满足
    end;
    counter := counter + 1;
    i := (i + 1);
    if i>n_guimo then
    begin
      i := (i - n_guimo);
    end;
  end;
 // memo1.lines.add('L解码次数：'+inttostr(lscount));
end;
//对比IG -2016文章
//评价对象   是加权空闲时间+平衡前后 左右 站的时间

procedure TForm1.Button6Click(Sender: TObject);
var
  A, B, C: Integer;
  i, d: Integer;
  Temperature: double;  //模拟退火温度
  ind: Integer;   //只用200作为个体
  rand_p: Integer;
  TotalT: Integer;
  T: Integer;
  Rand_insert: Integer;
  crow,times,line:integer;
  tem:double;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
//  for times := 1 to 20 do
  begin
    line := 1;
    ReadDate();
    B := 2;
    TotalT := 0;
    for A := 1 to n_guimo do   //计算所有工序时间之和
    begin
      TotalT := TotalT + jiepop[200].gongxu[A].shijian;
    end;
    T := 1;  //模拟退火参数
 //   repeat
      t1 := GetTickCount;
      BCT := CM[B];
      zhannumber := nm[B];
      CT := BCT * 1.2;//初始化CT
      d := 4;      //扰动大小(参数1)
      Temperature := (T * TotalT ) / ( 100*nm[B]);
      mNEH();    //[不完整，初始解质量没得达到]
      ind := 200;   //只有一个个体
      iteration := 0;
      DABC_decode(ind);
      IG_evaluate(ind);    //首次评价
      CT := jiepop[200].CTp;
      if jiepop[200].CTp <= CT then  //更新CT下降
      begin
        CT := jiepop[200].CTP - 1;
      end;
      bestjie := jiepop[200]; //最优解
      bestkexingjie := kexingjiepop[200];
      repeat   // 开始迭代
        iteration := iteration + 1;
    //    memo1.Lines.Add('iteration  '+inttostr(iteration));
        OperationJie :=  jiepop[200];
        OperationKexingjie := kexingjiepop[200];
   //     memo1.Lines.Add('迭代初值  '+inttostr(OperationJie.CTp));

      //  if randomrange(1,10)>=8 then
        begin
          for i := 1 to 4 do      //对op做d次insert扰动
          begin
            rand_p := (n_guimo - d + i);
            while rand_p = (n_guimo - d + i) do
            begin
              randomize;
              rand_p := RandomRange(1, n_guimo); //随机一个位置
            end;
            if rand_p < (n_guimo - d + i) then  //向后insert
            begin
              OperationJie.gongxu[250] := OperationJie.gongxu[rand_p]; //保存提取位置
              for A := rand_p + 1 to n_guimo - d + i do
              begin
                OperationJie.gongxu[A - 1] := OperationJie.gongxu[A];  //片段移动
              end;
              OperationJie.gongxu[n_guimo - d + i] := OperationJie.gongxu[250]; //insert 进入
            end
            else
            if rand_p > (n_guimo - d + i) then  //向前insert
            begin
              OperationJie.gongxu[250] := OperationJie.gongxu[rand_p]; //保存提取位置
              for A := rand_p - 1 downto n_guimo - d + i do
              begin
                OperationJie.gongxu[A + 1] := OperationJie.gongxu[A];  //片段移动
              end;
              OperationJie.gongxu[n_guimo - d + i] := OperationJie.gongxu[250]; //insert 进入
            end;
          end;
          begin                        //扰动有效[]
            jiepop[2]:= OperationJie;
            ind:=2;
            DABC_decode(ind);
            EDA_evaluate(ind);    //直评
            OperationJie:= jiepop[2];
            Operationkexingjie:=kexingjiepop[2];
            oldjiepop[2]:=jiepop[2];
            oldkexingjiepop[2]:=kexingjiepop[2];
       //     memo1.Lines.Add('扰动4次  '+inttostr(OperationJie.CTp));
          end;
        end;

        OperationJie_best := OperationJie;   //需要评价才能后序贪婪选择
        BestOperationKexingjie:=Operationkexingjie;
        if OperationJie.CTp < bestjie.CTp then
        begin
          bestkexingjie := Operationkexingjie;
          bestjie := OperationJie;
          CT:=  bestjie.CTp-1;
        //  memo1.Lines.Add('扰动更新了最优  '+inttostr(bestjie.CTp));
        end;
        for i := 1 to 4 do    //对op做d次insert,选择好的排序保留
        begin                  //n-d+i 做提取序     n-d+i 之前的随机位置做insert点
          oldjiepop[1]:=OperationJie;
          oldkexingjiepop[1]:=Operationkexingjie;
          randomize;
          for c := 1 to (n_guimo - d + i-1) do
          begin
            Rand_insert := c;  //insert点

            OperationJie.gongxu[250] := OperationJie.gongxu[n_guimo - d + i]; //保存提取位置
            for A := n_guimo - d + i - 1 downto Rand_insert do
            begin
              OperationJie.gongxu[A + 1] := OperationJie.gongxu[A];  //片段移动
            end;
            OperationJie.gongxu[Rand_insert] := OperationJie.gongxu[250]; //insert 进入

            jiepop[1] := OperationJie;

            ind := 1;
            DABC_decode(ind);
            IG_evaluate(ind);
            if OperationJie_best.CTp > jiepop[1].CTp then //给出来
            begin
              OperationJie_best := jiepop[1]; //更新
              BestOperationKexingjie:=kexingjiepop[1];
              OperationJie:=OperationJie_best;
              Operationkexingjie:=BestOperationKexingjie;
              if OperationJie.CTp < bestjie.CTp then
              begin
                bestkexingjie := Operationkexingjie;
                bestjie := OperationJie;
                CT:=  bestjie.CTp-1;
            //    memo1.Lines.Add('扰动后insert更新最优  '+inttostr(bestjie.CTp));
              end;
            end;
          end;
        end;
        LSjie := OperationJie_best;   //给到局部搜索
        lskexingjie:= Operationkexingjie;
       // CT:= LSjie.CTP;
        IG_LocalSearch();    //对op做局部搜索

        tem:=exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature);
        if LSjie.CTp < jiepop[200].CTp then   //LS<KEXING200
        begin
          kexingjiepop[200] := LSKexingjie;  //获得更新 排序
          jiepop[200] := LSjie;              //获得更新  站内信息
     //     memo1.Lines.Add('局部LS更新了迭代初值，得到：  '+inttostr(LSjie.CTp));
          if LSjie.CTp  < bestjie.CTp then
          begin
            bestkexingjie :=LSKexingjie;
            bestjie :=LSjie;
            CT:= bestjie.CTp-1;
  //          memo1.Lines.Add('本次迭代更新了最优，得到：  '+inttostr(bestjie.CTp));
          end
        end
        else
                                  //exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature)
       if randomrange(1,10)/10>exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature) then
        begin
          kexingjiepop[200] := LSKexingjie;  //获得更新 排序
          jiepop[200] := LSjie;
        end;
        memo1.lines.add(inttostr(bestjie.ctp));
        t2 := GetTickCount;
      until t2 - t1 > n_guimo * n_guimo * 15;
     // Memo1.Lines.Add('ITERATION  ' + IntToStr(iteration));
   //   Memo1.Lines.Add('CT   ' + IntToStr(bestjie.CTp));
   //   Memo1.Lines.Add('SI   ' + FloatToStr(bestjie.LSI));
      ExcelApp.Cells[line, crow].Value := IntToStr(bestjie.CTp);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
 //     B := B + 1;
 //   until nm[B] = 0; //更换站点数据

    crow := crow + 2;
    CLEAR();
  end;
end;

//关键环节验证  全程不考虑工序相关性 仅用EDA学习
procedure TForm1.Button7Click(Sender: TObject);
var
  bestCTp: Integer;
  a, b, c, d: Integer;
  b_num: integer; //站数目下标
  t1, t2: Double;
  ind: integer;
  p: integer; //测试
  bestgongxu: string;
  num: Integer;
  Lorder, Rorder, yuanshixu: string;
  itera: Integer;
  choose: Integer;  //参数组合
  PTEXT: Integer;
  times: Integer;
  line, crow: Integer;
//  y: TObject;  //输出到外部表格
  x, y: Integer;
begin
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
  for times := 1 to 10 do
  begin
    Readdate();       //载入数据集
    CT := 0;
    b_num := 1;
    line := 1;
    repeat
      t1 := gettickcount();
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      popsize := 100;  //种群大小【参数】
      aerfa := 0.7;    //学习率  【参数】
      yita := 0.1;    //精英占比【参数】
      insert_times := 20;  //对最优个体做insert次数 【参数】  提取位置
   //   EDAModel_initial();   //备份model
      EDAGetFirstCT();
  //    EDA_Relationship_Matrix_initial();
      iteration := 0; //必须在评价初始解前面
      EDA_Createpop_Intial();   //初始化种群   1+29+70
      EDA_maopao();
      bestjie := jiepop[1];
      CT := jiepop[1].ctp;      //更新CT
      CT := CT - 1;  //压缩CT
      for x := 1 to n_guimo do   //不考虑位置限制
        for y := 1 to n_guimo do
        begin
          Local_Matrix[x, y] := 1;
        end;
      for x := 1 to n_guimo do
      begin
        Local_Matrix[x, 0] := x;
        Local_Matrix[0, x] := x;
      end;

      repeat
        iteration := iteration + 1;
      //  EDA_UPdate_Relationship_Matrix();  //首次更新关系矩阵 (关系矩阵的积累在解码中更新)
        EDAModel_update();        //取前5%更新EDAModel
      //  EDAModeL_sample(); //采样EDA生成新种群个体 //质量再次变差
        EDA1_sample();
        EDA_maopao();         //排序个体  排一维解序列
        EDA_LS1(); //WUWU        //  LS  中更新历史最优  及CT
        jiepop[101] := bestjie;
        ind := 101;
        begin
          EDA_LS2(); //WUWU        //  LS  中更新历史最优  及CT
        end;
        jiepop[6] := bestjie;
        t2 := gettickcount();
      until t2 - t1 > n_guimo * n_guimo * 5; //卡时间停止
      EDA_Reconstruction_strategy();
      Memo1.Lines.Add('最优节拍：' + FloatToStr(CT + 1));
      Memo1.Lines.Add('最优SI：' + FloatToStr(bestjie.LSI));
      ExcelApp.Cells[line, crow].Value := FloatToStr(CT + 1);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
      //输出最优方案
     { bestgongxu:='';
      for A:=1 to n_guimo do
      begin
        bestgongxu:=bestgongxu+','+inttostr(bestjie.gongxu[a].xu);
      end;
   //   EDA_update_gantte(zhanNumber);
      Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (BestKexingjie.zuoBianzhan[a].kexingGongxu[c]=0)and(BestKexingjie.youBianzhan[a].kexingGongxu[c]=0) ;
        if BestKexingjie.zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(BestKexingjie.zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  空  ';
        end;
        Lorder:=Lorder+'  |  ';
        if BestKexingjie.youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(BestKexingjie.youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  空  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      Memo1.Lines.Add('实际迭代数：'+inttostr(iteration));
      Memo1.Lines.Add('工序规模：'+inttostr(n_guimo));
      Memo1.Lines.Add('工位规模：'+inttostr(zhannumber));
      Memo1.Lines.Add('最优节拍：'+FloatToStr(CT+1));
      Memo1.Lines.Add('左边站方案：'+Lorder);
      Memo1.Lines.Add('右边站方案：'+Rorder);
      Memo1.Lines.Add('原始序：'+bestgongxu);
      Memo1.Lines.Add('              ');  }
      b_num := b_num + 1; //换装配站数目
    until nm[b_num] = 0;  //该规模测试集所有站规模结束
    crow := crow + 2;
    CLEAR();
  end;
  ExcelApp.Activeteworkbook.save;
end;

procedure TForm1.Button8Click(Sender: TObject);
VAR
b_num:INTEGER;

BEGIN
    Readdate();       //载入数据集
    b_num:=1;
    repeat
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      EDAGetFirstCT();
      memo1.Lines.Add('M:  '+INTTOSTR(zhanNumber)+'  LB: '+inttostr(bct)+'  CT  '+floattostr(CT));
      b_num:=b_num+1;
    until  nm[b_num]=0;
END;

procedure direct_decode(var ind: Integer);
var
  A, B, C: Integer;
begin

end;

procedure TForm1.BAS_swap(var ind: Integer);
var
  a, b, c, d: Integer;
  Point1: Integer;
  time: Integer;
begin
  time := 1;

  repeat
    DABC_bad_MATRIX(ind);
    if Badset <> [] then
    begin
      for d := 1 to 2 do
      begin
        c := RandomRange(1, n_guimo);
        b := RandomRange(1, n_guimo);
        jiepop[101] := jiepop[ind];
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[b];
        jiepop[ind].gongxu[b] := jiepop[101].gongxu[c];
      end;

      jiepop[101] := jiepop[102];  //复原

      ;
      DABC_decode(ind);

      DABC_evaluate(ind);
      if jiepop[ind].CTp <= CT then
      begin
        CT := jiepop[ind].CTp;
        CT := CT - 1;
        Memo1.Lines.Add(FloatToStr(CT));
      end;
      time := time + 1;
    end;
  until time = 100000000000;
end;

procedure TForm1.bad_MATRIX();
var
  A, B: Integer;
begin
  for A := 1 to zhannumber do
  begin
    if kexingjiepop[101].Station[A].FreeTime <> 0 then
    begin
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[101].zuoBianzhan[A].gxEndTime[B] <> jiepop[101].gongxu[kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[101].zuoBianzhan[A].gxEndTime[B] - kexingjiepop[101].zuoBianzhan[A].gxEndTime[B - 1] <> jiepop[101].gongxu[kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B] = 0;
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[101].youBianzhan[A].gxEndTime[B] <> jiepop[101].gongxu[kexingjiepop[101].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].youBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[101].youBianzhan[A].gxEndTime[B] - kexingjiepop[101].youBianzhan[A].gxEndTime[B - 1] <> jiepop[101].gongxu[kexingjiepop[101].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].youBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[101].youBianzhan[A].kexingGongxu[B] = 0;
    end;
  end;
end;

procedure TForm1.DABC_bad_MATRIX(var ind: Integer);
var
  A, B, c, num: Integer;
  SET1: set of 1..255;
begin
  SET1 := Badset;
  badset := [];
  for A := 1 to zhannumber do
  begin
    if kexingjiepop[ind].Station[A].FreeTime <> 0 then
    begin
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B] <> jiepop[ind].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B] - kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B - 1] <> jiepop[ind].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B] = 0;
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[ind].youBianzhan[A].gxEndTime[B] <> jiepop[ind].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[ind].youBianzhan[A].gxEndTime[B] - kexingjiepop[ind].youBianzhan[A].gxEndTime[B - 1] <> jiepop[ind].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[B] = 0;
    end;
  end;
  num := 0;
  if SET1 <> Badset then
  begin
//    for c in badset  do inc(num);
//    memo1.lines.add(inttostr(num));
  end;
end;

procedure TForm1.BAS_RefreashMartrix(var ind: Integer);
var
  a: Integer;
  b: Integer;
begin
  for a := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[a].zhuangtai = 0 then
    begin
      for b := 1 to n_guimo do
      begin
        Local_Matrix[jiepop[102].gongxu[jiepop[ind].gongxu[a].xu].xu, b] := 0;
      end;
    end;
  end;
end;

procedure TForm1.BAS_evaluate(var ind: integer);
var
  LevelA: integer;  //1表示两个解的CTp不相等  //-1表示两个解的CTP相等
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
label
  1;
begin
  MaxT := 0;
  LevelA := 0;       //初始化0
  //此处写一级评价过程       一级：每个站末尾时间+CT-末尾时间
  //并给出标志符leveA的值
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  if (iteration > 0) and (kexingjiepop[ind].CTp = oldkexingjiepop[ind].CTp) then
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//权重结果越小越好
    begin                       //但站的节拍存放到左边站里面的，直接覆盖左边
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    if compare2 < compare1 then  //原来的解更好则，换回去
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //新解更好  备份old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else if (iteration > 0) and (oldkexingjiepop[ind].CTp < kexingjiepop[ind].CTp) then  //换回去
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //新解更好  备份old
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;

  jiepop[ind].CTp := kexingjiepop[ind].CTp;

  for pzhan := 1 to zhannumber do
  begin
    A := 1;
    kexingjiepop[ind].Station[pzhan].FreeTime := 0;
    T_Light := 0;
    repeat
      if kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] <> 0 then
      begin
        if A = 1 then
        begin
          T_Light := T_Light + (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[A]].shijian);
        end
        else
        begin
          T_Light := T_Light + (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[A]].shijian - kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A - 1]);
        end;
      end;
      A := A + 1;
    until kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] = 0;
    T_Light := T_Light + trunc(CT) - kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A - 1];

    A := 1;
    kexingjiepop[ind].Station[pzhan].FreeTime := 0;
    T_Right := 0;
    repeat
      if kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] <> 0 then
      begin
        if A = 1 then
        begin
          T_Right := T_Right + (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[A]].shijian);
        end
        else
        begin
          T_Right := T_Right + (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[A]].shijian - kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A - 1]);
        end;
      end;
      A := A + 1;
    until kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] = 0;
    T_Right := T_Right + trunc(CT) - kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A - 1];

    kexingjiepop[ind].Station[pzhan].FreeTime := T_Right + T_Light;

    if kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian >= kexingjiepop[ind].youBianzhan[pzhan].zongshijian then
    begin
      kexingjiepop[ind].Station[pzhan].OverTime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian;
    end
    else
    begin
      kexingjiepop[ind].Station[pzhan].OverTime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian;
    end;

  end;
end;
//读入数据[增加最紧邻前后约束工序]

procedure TForm1.ReadDate();
var
  ExcelApp: Variant;
  a, b, c, d, e: integer;
  total: integer;
  maxT: Integer;
  p_stop: Integer; //末端位置
  TM2:array[1..20] of double; //理想均值时间
  TM: array[1..20] of integer; //理想均值时间
  L_Time, R_Time: integer;
  L_M_time, R_M_time: array[1..20] of integer; //左右边时间下界
begin
  ExcelApp := CreateOleObject('Excel.Application');  //创建Excel
  n_guimo := StrToInt(Edit1.Text);
  ExcelApp.WorkBooks.Open('C:\p' + INTTOSTR(n_guimo) + '.xls');
  ExcelApp.WorkSheets[1].Activate;
  //时间，方向，状态，直接后序相关
  for a := 1 to n_guimo do
  begin
    jiepop[300].gongxu[a].xu := a;
    jiepop[300].gongxu[a].zhuangtai := 1; //初始化状态为可分配  //1代表可分配    0 代表已分配
    jiepop[300].gongxu[a].fangxiang := ExcelApp.Cells[a, 2].Value;
    jiepop[300].gongxu[a].shijian := ExcelApp.Cells[a, 3].Value;
    if ExcelApp.Cells[a, 4].Value = 0 then //【导入后序】
    begin
      jiepop[b].gongxu[a].houxu[1] := 0;
      c := 4;
    end
    else
    begin
      b := 1;
      c := 4;           //从第四列开始是直接后续编号  //直到遇到0
      repeat
        jiepop[300].gongxu[a].houxu[b] := ExcelApp.Cells[a, c].Value;
        c := c + 1;
        b := b + 1;
      until ExcelApp.Cells[a, c].Value = 0;
    end;
  end;
  for c := 1 to 20 do
  begin
    nm[c] := 0;
  end;
  c := 1;
  repeat   //导入站数目
    nm[c] := ExcelApp.Cells[n_guimo + 1, c].Value;
    c := c + 1;
  until ExcelApp.Cells[n_guimo + 1, c].Value = 0;
  //计算下界CM  即LB=max(左边时间之和/m,右边时间之和/m,tmax,T总/2m)
  total := 0;
  for a := 1 to n_guimo do
  begin
    total := total + jiepop[300].gongxu[a].shijian;
  end;
  c := 1;
  repeat
    CMean[c] := total / (2 * nm[c]);
    c := c + 1;
  until nm[c] = 0;
  //找到工序最大的加工时间
  maxT := jiepop[300].gongxu[1].shijian;
  for a := 2 to n_guimo do
  begin
    if jiepop[300].gongxu[a].shijian > maxT then
      maxT := jiepop[300].gongxu[a].shijian;
  end;
  //计算本规模所有测试站点的【CM值】，全局变量
  c := 1;
  repeat
    if trunc(total / (2 * nm[c]))=(total / (2 * nm[c])) then
    begin
      TM[c] := trunc(total / (2 * nm[c]) );
    end
    else
    begin
      TM[c] := trunc(total / (2 * nm[c]) + 1);    //向上取整
    end;
    TM2[c] := (total / (2 * nm[c]) );    //向上取整
    c := c + 1;
  until nm[c] = 0;
  //计算左右边均值时间
  L_Time := 0;
  R_Time := 0;
  for a := 1 to n_guimo do
  begin
    if jiepop[300].gongxu[a].fangxiang = -1 then
    begin
      L_Time := L_Time + jiepop[300].gongxu[a].shijian;
    end;
    if jiepop[300].gongxu[a].fangxiang = 1 then
    begin
      R_Time := R_Time + jiepop[300].gongxu[a].shijian;
    end;
  end;
  a := 1;
  repeat
    L_M_time[a] := trunc(L_Time / nm[a]) + 1; //向上取整
    R_M_time[a] := trunc(R_Time / nm[a]) + 1;
    a := a + 1;
  until nm[a] = 0;
  a := 1;
  repeat
    CM[a] := max(max(L_M_time[a], R_M_time[a]), max(TM[a], maxT));
    a := a + 1;
  until nm[a] = 0;
  //算出所有前序工序内容   [已验证，无误]
  for a := 1 to n_guimo do
  begin
    d := 1;
    for b := 1 to n_guimo do
    begin
      c := 1;
      repeat
        if jiepop[300].gongxu[b].houxu[c] = a then
        begin
          jiepop[300].gongxu[a].qianxu[d] := b;
          d := d + 1;
        end;
        c := c + 1;
      until jiepop[300].gongxu[b].houxu[c] = 0;
      ;
    end;

  end;

  EDA_initial_matrix_3();
  for a := 1 to n_guimo do
  begin
    for b := 1 to 3 do
    begin
      copy_stop_Matrix[a, b] := stop_Matrix[a, b];
    end;
  end;
  jiepop[299] := jiepop[300];   //备份  读入的数据
  EDAModel_initial();   //备份model
  Total_process_time:=0;
  for A := 1 to n_guimo do
  begin
    Total_process_time:=Total_process_time+jiepop[300].gongxu[a].shijian;
  end;
  // 关闭工作簿：
  ExcelApp.WorkBooks.Close;
  //退出 Excel：
  ExcelApp.Quit;
  memo1.Lines.Add('导入完毕！')
end;

//利用集合获取序的位置

procedure TForm1.EDA_initial_matrix_3();
var
  a, b, c, d: integer;
  num: array[1..250] of integer;
  pos_a, pos_b: array[1..250] of integer;
begin
  //前向数目
  for a := 1 to n_guimo do
  for b := 1 to n_guimo do
  local_matrix[a,b]:=0;
  for a := 1 to n_guimo do
  begin
    gongxuset[a].aset := [];
  end;
  for a := 1 to n_guimo do  //获取每个工序的前序集合
  begin
    if jiepop[300].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].aset := gongxuset[a].aset + [jiepop[300].gongxu[a].qianxu[b]];
        b := b + 1;
      until jiepop[300].gongxu[a].qianxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do      //记录紧邻前序个数
  begin
    num[a] := 0;
    for c in gongxuset[a].anearset do
      Inc(num[a]);
    jiepop[300].gongxu[a].aNearnum := num[a];
  end;

  for a := 1 to n_guimo do
  begin
    gongxuset[a].anearset := gongxuset[a].aset;
  end;
  for a := 1 to n_guimo do   //前序集合相加
  begin
    if jiepop[300].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].aset := gongxuset[a].aset + gongxuset[jiepop[300].gongxu[a].qianxu[b]].aset;
        b := b + 1;
      until jiepop[300].gongxu[a].qianxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do   //累计出数目
  begin
    num[a] := 0;
    for c in gongxuset[a].aset do
      Inc(num[a]);
  end;
  for a := 1 to n_guimo do
  begin
    pos_a[a] := num[a] + 1;    //记录开始位置
    jiepop[300].gongxu[a].anum := num[a]; //记录前向数目
  end;
  //计算后项数目
  for a := 1 to n_guimo do
  begin
    gongxuset[a].bset := [];
  end;
  for a := 1 to n_guimo do  //获取每个工序的后序集合
  begin
    if jiepop[300].gongxu[a].houxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].bset := gongxuset[a].bset + [jiepop[300].gongxu[a].houxu[b]];
        b := b + 1;
      until jiepop[300].gongxu[a].houxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do
  begin
    gongxuset[a].bnearset := gongxuset[a].bset;
  end;
  for a := 1 to n_guimo do
  begin
    num[a] := 0;
    for c in gongxuset[a].bnearset do
      Inc(num[a]);
    jiepop[300].gongxu[a].bNearnum := num[a];
  end;
  for a := n_guimo downto 1 do
  begin
    if jiepop[300].gongxu[a].houxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].bset := gongxuset[a].bset + gongxuset[jiepop[300].gongxu[a].houxu[b]].bset;
        b := b + 1;
      until jiepop[300].gongxu[a].houxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do   //累计出数目
  begin
    num[a] := 0;
    for c in gongxuset[a].bset do
      Inc(num[a]);
  end;
  for a := 1 to n_guimo do
  begin
    pos_b[a] := n_guimo - num[a];    //记录最晚位置
    jiepop[300].gongxu[a].bnum := num[a]; //记录前向数目
  end;
  //构建残缺矩阵
  for a := 1 to n_guimo do
  begin
    local_matrix[0, a] := a;
    local_matrix[a, 0] := a;
  end;
  for a := 1 to n_guimo do
  begin
    for b := pos_a[a] to pos_b[a] do
    begin
      local_matrix[a, b] := 1;
    end;
  end;
  for a := 1 to n_guimo do
  begin
    jiepop[300].gongxu[a].aset := gongxuset[a].aset;
    jiepop[300].gongxu[a].bset := gongxuset[a].bset;
    jiepop[300].gongxu[a].anearset := gongxuset[a].anearset;
    jiepop[300].gongxu[a].bnearset := gongxuset[a].bnearset;
  end;
  for b := 1 to n_guimo do   //备份  位置矩阵
  begin
    for c := 1 to n_guimo do   //工序
    begin
      Local_Matrix[b, c]:= 1;
    end;
  end;
end;

procedure TForm1.EDA_initial_matrix_2();
var
  a, b, c, d: integer;
  matrix_nn: array[1..250] of array[1..250] of integer;
  num: integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
      matrix_nn[a, b] := 0;  //清空
  for a := n_guimo downto 1 do
  begin
    if jiepop[101].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      num := 0;
      repeat
        matrix_nn[a, jiepop[101].gongxu[a].qianxu[b]] := 1;
        num := num + 1;
        b := b + 1;
      until jiepop[101].gongxu[a].qianxu[b] = 0;
      for b := 1 to n_guimo do
      begin
        if matrix_nn[b, a] <> 0 then
          matrix_nn[b, a] := matrix_nn[b, a] + num;
      end;
    end;
  end;
end;

procedure TForm1.EDA_initial_matrix();
var
  a, b, c: integer;
 // pos_a,pos_b:integer; //最早，最晚位置
  T_matrix: array[1..250] of array[1..250] of integer;
  lie_sum: integer;  //列和
  hang_sum: integer;
  pos_a, pos_b: array[1..250] of integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
      T_matrix[a, b] := 0;
  //通过后序找前序数目
  for a := 1 to n_guimo do
  begin
    if jiepop[101].gongxu[a].houxu[1] <> 0 then //有后序才更新矩阵
    begin
      b := 1;
      repeat
        lie_sum := 0;
        for c := 1 to n_guimo do
        begin
          lie_sum := lie_sum + T_matrix[c, a];
        end;
        T_matrix[a, jiepop[101].gongxu[a].houxu[b]] := lie_sum + 1;
        b := b + 1;
      until (jiepop[101].gongxu[a].houxu[b]) = 0; //无后序

    end;
  end;
  for a := 1 to n_guimo do
  begin
    pos_a[a] := 0;
  end;
  for a := 1 to n_guimo do
  begin
    for b := 1 to n_guimo do
    begin
      pos_a[a] := pos_a[a] + T_matrix[b, a];  //前序个数
    end;
  end;
  for a := 1 to 250 do
    for b := 1 to 250 do
      T_matrix[a, b] := 0;
  //通过前序找后序数目
  for a := n_guimo downto 1 do
  begin
    if jiepop[101].gongxu[a].qianxu[1] <> 0 then //有后序才更新矩阵
    begin
      b := 1;
      repeat
        lie_sum := 0;
        for c := 1 to n_guimo do
        begin
          lie_sum := lie_sum + T_matrix[c, a];
        end;
        T_matrix[a, jiepop[101].gongxu[a].qianxu[b]] := lie_sum + 1;
        b := b + 1;
      until (jiepop[101].gongxu[a].qianxu[b]) = 0; //无后序

    end;
  end;
  for a := 1 to n_guimo do
  begin
    pos_b[a] := 0;
  end;
  for a := 1 to n_guimo do
  begin
    for b := 1 to n_guimo do
    begin
      pos_b[a] := pos_b[a] + T_matrix[b, a];  //后序个数
    end;
  end;
  //初始化概率矩阵
  for a := 1 to n_guimo do
    local_MATRIX[0, a] := a;
  for a := 1 to n_guimo do
    local_MATRIX[a, 0] := a;
  for a := 1 to n_guimo do  //n行
    for b := pos_a[a] + 1 to (n_guimo - pos_b[a]) do
      local_MATRIX[a, b] := 1;

end;
//输出：某位置上出现某个工序二维矩阵
//输入：工序总长度 n_guimo    【不用这个方法】

procedure TForm1.EDAModel_initial();//初始化概率分布模型
var
  a, b: Integer;
begin
  for a := 0 to n_guimo do   //位置
  begin
    for b := 0 to n_guimo do   //工序
    begin
      TwoMatrix[a, b] := Local_Matrix[a, b];
      init_TwoMatrix[a, b] := Local_Matrix[a, b];
    end;
  end;
  //根据工序有向图将不可能的位置标记为0
  //前序个数后续个数确定该工序不可能在哪些位置出现
  //以此减小概率矩阵的区域大小
end;
//输出：满足工序约束的直接可行一维解
//方式：根据概率矩阵随机生成 // 不使用概率采样
//种群规模：100个

procedure TForm1.EDAPopModel_initial();
var
  a, b, c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  ceshi1: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;
  repeat
    for b := 1 to n_guimo do    //序长度
    begin             //jiepop101动态变化   102固定不变
      for c := 1 to n_guimo do
      begin           //依次判断是否满足前序约束
        if Local_Matrix[c, b] <> 0 then       //=0说明该工序在该位置不可能
        begin         //c表示序的下标      //[行,列]
          d := 1;
          repeat
            if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //有前序未安排
              Local_Matrix[c, b] := 0;  //该位置置零 //记得恢复
              goto 3;                //跳出遍历
            end;
            d := d + 1;
          until jiepop[102].gongxu[c].qianxu[d] = 0; //遍历该工序的所有直接前序
        end;
3:

      end;           //得到部分位置更新清零后的model
      begin //在该列中轮盘赌选择
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //累计概率值
            pind[e, 2] := d;    //记录概率的位置
            pind[e + 1, 2] := 0;  //结束查找标志
          end;
        end;
        numR := Random(trunc(psum * 100)) / 100; //生成区间内随机数

        e := 1;
        repeat
          if pind[e, 1] >= numR then
          begin
            jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //更新工序状态
            for d := 1 to n_guimo do
            begin        //采样模型更新
              Local_Matrix[jiepop[ind].gongxu[b].xu, d] := 0;
            end;
            goto 5;

          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end
    end;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //复原矩阵
        Local_Matrix[b, c] := TwoMatrix[b, c]; //初始矩阵
      end;
    end;
     //复原数据集
    jiepop[101] := jiepop[102];
    DABC_decode(ind);
    DABC_evaluate(ind);
    ind := ind + 1;
  until ind = 101;
end;

//EDA解码
procedure TForm1.EDA_jiema();
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //本站满标志
  Rzanman: integer;   //右边一次放不下标志
  Lzanman: integer;   //右边一次放不下标志
  duimianyueshu: Integer;  //对面约束标志   1为存在约束
  ind: Integer;       //个体下标
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //序列位置下标
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
label
  1;
label
  3; //超出站数目，无效解，跳出
begin
  //测试
  //CT:=6;
  //zhannumber:=3;
  if iteration = 0 then
  begin
    indcopy := 0; //下标
  end;
  for ind := 1 to popsize do
  begin
    Copykexingjiepop[ind] := kexingjiepop[ind];
  end;
  for ind := 1 to n_guimo do
  begin
    kexingjiepop[ind] := kexingjiepop[101];
  end;
  for ind := 1 to popsize do //种群全部解码
  begin
    matrix_line1 := '';
    for a := 1 to n_guimo do
    begin
      matrix_line1 := matrix_line1 + ',' + inttostr(EdaFeasibleSolution[ind].gongxu[a].xu);
    end;
  //  memo1.lines.add(matrix_line1);
    P_zuo := 1;     //站点归一
    P_you := 1;
    L_gongxu := 1;  //站内序归一
    R_gongxu := 1;
    b := 1;
    repeat  //基于工序循环分配
  //    memo1.lines.Add(matrix_line1);
      if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
      begin     //E型工序
      //测试
  //    memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'该工序为E型');
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //两边空闲相等

          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //下一个也是E型  //默认左边
          //测试
      //      memo1.lines.Add('E型，空闲时间相同，后序也为E，');
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //满足CT则
            begin    //判满足CT否
       //       memo1.lines.Add('E型，空闲时间相同，放的下，左边');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //工序位置递增
            end
            else   //放到下一个站
            begin
      //        memo1.lines.Add('E型，空闲时间相同，本站放不下，开辟新站直接放');
              P_zuo := P_zuo + 1;  //站递增
              L_gongxu := 1;     //工序归 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //下标递增
            end;
          end
          else    //下一个是R型
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //选L边
          //测试
     //     memo1.lines.Add('E型，空闲时间相同，后序为右，尝试放左边');
            if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
      //        memo1.lines.Add('E型，空闲时间相同，放的下，左边');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end
            else
            begin       //开辟新站直接放
      //        memo1.lines.Add('E型，空闲时间相同，本站放不下，开辟新站直接放');
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end;
          end
          else  //下一个是L型
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //选R边
            //测试
     //       memo1.lines.Add('E型，空闲时间相同，后序为左边,放右边');
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end;
          end;
        end
        else        //【【难点】站数目不同】
if P_zuo = P_you then    //左右站在同一位置
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
          begin   //右边空闲大于左边空闲 【难点】  //选右边
            //测试
       //     memo1.Lines.Add('E型，右边空大，判断左边工序是否是本E的紧邻前序约束');
            duimianyueshu := 0;  //初始化对面时间约束为0
            c := 1;    //遍历本工序的前约束工序
            repeat   //如果对面是本工序的前约束工序
              if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
              begin
                duimianyueshu := 1;    //如果成立则约束为1
              end;
              c := c + 1;
            until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
            if duimianyueshu = 1 then //对面时间约束
            begin
              //测试
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
         //       memo1.Lines.Add('有约束且放得下，放空间小的左边'); //则放到空间小的一边
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end
              else     //小空间放不下，大的也不，跳出
              begin
              //测试
       //         memo1.Lines.Add('有约束小空间放不下，站递增'); //则放到空间小的一边
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end;
            end
            else if duimianyueshu = 0 then //对面时间不约束
            begin
              //测试
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
       //         memo1.Lines.Add('无约束,放空间大右边');
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1;
              end
              else
              begin
              //测试
      //          memo1.Lines.Add('无约束大空间放不下，站递增'); //则放到空间小的一边
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1;
              end;
            end;
          end
          else     //左边空闲大于右边
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
          begin   //选L边
            //测试
      //      memo1.Lines.Add('E型，左边空大，判断右边工序是否是本E的紧邻前序约束');
            duimianyueshu := 0;  //初始化对面时间约束为0
            c := 1;    //遍历本工序的前约束工序
            repeat   //如果对面是本工序的前约束工序
              if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
              begin
                duimianyueshu := 1;    //如果成立则约束为1
              end;
              c := c + 1;
            until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
            if duimianyueshu = 1 then //对面时间约束
            begin
            //测试
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
        //        memo1.Lines.Add('有约束,放的下，放空间小的左边');
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1; //下标递增
              end
              else
              begin
        //        memo1.Lines.Add('有约束,放不下，站递增');
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1; //下标递增
              end;
            end
            else if duimianyueshu = 0 then  //对面时间不约束
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
                //测试
        //        memo1.Lines.Add('无约束，放得下，放空间大的左边');
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1;
              end
              else
              begin
     //           memo1.Lines.Add('无约束，放不下，站递增');
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1;
              end;
            end;
          end;
        end
        else if P_zuo > P_you then   //左边快于右边  //放右边看看放得下不
        begin
      //    memo1.lines.add('左边站位置数目大于右边');
          duimianyueshu := 0;  //初始化对面时间约束为0
          c := 1;    //遍历本工序的前约束工序
          repeat   //如果对面是本工序的前约束工序
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
            begin
              duimianyueshu := 1;    //如果成立则约束为1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
          if duimianyueshu = 1 then //对面时间约束
          begin
            //测试
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
        //      memo1.Lines.Add('有约束且放得下，放空间小的左边'); //则放到空间小的一边
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //下标递增
            end
            else     //小空间放不下，大的也不，跳出
            begin
            //测试
      //        memo1.Lines.Add('有约束小空间放不下，站递增'); //则放到空间小的一边
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //下标递增
            end;
          end
          else if duimianyueshu = 0 then //对面时间不约束
          begin
            //测试
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
       //       memo1.Lines.Add('无约束,放空间大右边');
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end
            else
            begin
            //测试
     //         memo1.Lines.Add('无约束大空间放不下，站递增'); //则放到空间小的一边
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end;
          end;
        end
        else if P_zuo < P_you then   //右边快于左边
        begin
      //    memo1.lines.add('右边站位置数目大于左边');
          duimianyueshu := 0;  //初始化对面时间约束为0
          c := 1;    //遍历本工序的前约束工序
          repeat   //如果对面是本工序的前约束工序
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
            begin
              duimianyueshu := 1;    //如果成立则约束为1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
          if duimianyueshu = 1 then //对面时间约束
          begin
          //测试
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
        //      memo1.Lines.Add('有约束,放的下，放空间小的左边');
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //下标递增
            end
            else
            begin
        //      memo1.Lines.Add('有约束,放不下，站递增');
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //下标递增
            end;
          end
          else if duimianyueshu = 0 then  //对面时间不约束
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
              //测试
        //      memo1.Lines.Add('无约束，放得下，放空间大的左边');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end
            else
            begin
        //      memo1.Lines.Add('无约束，放不下，站递增');
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end;
          end;
        end;
      end
      else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //【左边型工序】   //判右边是否约束
      begin
      //测试
    //    memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'该工序为L型');
        duimianyueshu := 0;  //初始化对面时间约束为0，无
        if ((P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].youBianzhan[P_zuo].zongshijian)) or (P_zuo < P_you) then
        begin
          c := 1;    //遍历本工序的紧邻前约束工序
          repeat   //如果对面是本工序的前约束工序
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
            begin
              duimianyueshu := 1;    //如果成立则约束为1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
        end;
        if duimianyueshu = 1 then //对面时间约束
        begin
          begin
            if P_zuo = P_you then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
            //    memo1.lines.Add('约束在同站，满足CT');
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end
              else
              begin
            //    memo1.lines.Add('约束在同站，不满足CT,开辟新站，直接放');
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end;
            end
            else if P_zuo < P_you then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
       //         memo1.lines.Add('约束在下一个站,满足CT,以对面更新时间');
                P_zuo := P_you;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end
              else
              begin
         //       memo1.lines.Add('约束在下一个站,不满足CT,再开辟一个新站，此时比右边快了');
                P_zuo := P_you + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //下标递增
              end;
            end
          end
        end
        else if duimianyueshu = 0 then  //对面时间不约束
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
          begin
            //测试
       //     memo1.lines.Add('不存在对面约束，满足CT');
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            L_gongxu := L_gongxu + 1;
          end
          else
          begin
        //    memo1.lines.Add('不存在对面约束，不满足CT');
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            L_gongxu := L_gongxu + 1;
          end;
        end;
      end
      else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //【右边型工序】
      begin
      //测试
       // memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'该工序为R型');
        duimianyueshu := 0;  //初始化对面时间约束为0
        if ((P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].youBianzhan[P_zuo].zongshijian)) or (P_zuo > P_you) then
        begin
          c := 1;    //遍历本工序的前约束工序
          repeat   //如果对面是本工序的前约束工序
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
            begin
              duimianyueshu := 1;    //如果成立则约束为1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
        end;
        if duimianyueshu = 1 then //对面时间约束
        begin
          if P_zuo = P_you then
          begin
            //测试
         //   memo1.lines.Add('存在对面约束');
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            R_gongxu := R_gongxu + 1; //下标递增
          end
          else if P_zuo > P_you then   //站递增更新
          begin
            P_you := P_zuo;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            R_gongxu := R_gongxu + 1; //下标递增
          end;
        end
        else if duimianyueshu = 0 then //对面时间不约束
        begin
          //测试
      //    memo1.lines.Add('不存在对面约束');
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          R_gongxu := R_gongxu + 1; //下标递增
        end;
      end;
      b := b + 1;  //继续分配
      if (P_you > zhanNumber) or (P_zuo > zhanNumber) then
      begin
        if iteration = 0 then
        begin
          kexingjiepop[ind] := copykexingjiepop[indcopy];
          EdaFeasibleSolution[ind] := copyEdaFeasibleSolution[indcopy];
        end
        else
        begin
          kexingjiepop[ind] := copykexingjiepop[ind];  //替换回原来的可行解
          EdaFeasibleSolution[ind] := copyEdaFeasibleSolution[ind]; //替换会原来的排序
        end;
        goto 3;
      end;
    until b = n_guimo + 1;  //左右都满 //本配对站已满
    if iteration = 0 then  //初始解码时备份一个可行集
    begin
      indcopy := indcopy + 1;
      copykexingjiepop[indcopy] := kexingjiepop[ind];  //替换回原来的可行解
      copyEdaFeasibleSolution[indcopy] := EdaFeasibleSolution[ind];
    end;
3:

  end;  //全部分配完毕
  for a := 1 to zhannumber do     //计算每个站的完成时间
  begin
    if kexingjiepop[ind].zuobianzhan[a].zongshijian <> 0 then
    begin   //如果是可行解
      if kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian then
        kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
    end;
  end;
end;
//EDA解码

procedure TForm1.EDA_jiema_one(var ind: integer);
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //本站满标志
  Rzanman: integer;   //右边一次放不下标志
  Lzanman: integer;   //右边一次放不下标志
  duimianyueshu: Integer;  //对面约束标志   1为存在约束
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //序列位置下标
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
  back: Integer;
  back_P_you, back_P_zuo: Integer; //回溯用
  i: Integer;
  num: Integer;
label
  1;
label
  3; //超出站数目，无效解，跳出
label
  2;
label
  4;
label
  5;
label
  86; //分配后跳出
begin
  jiepop[ind] := jiepop[101];
  kexingjiepop[ind] := kexingjiepop[101];    // 清空
  P_zuo := 1;     //站点归一
  P_you := 1;
  L_gongxu := 1;  //站内序归一
  R_gongxu := 1;
  b := 1;
  repeat  //基于工序循环分配
    if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
    begin     //E型工序
      if P_zuo = P_you then    //左右站在同一位置
      begin
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //两边空闲相等
          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //下一个也是E型  //默认左边
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //满足CT则
            begin    //判满足CT否         //【无误】
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //工序位置递增
              goto 86;
            end
            else   //放到下一个站
            begin           //wuwu            【无误】
              P_zuo := P_zuo + 1;  //站递增
              L_gongxu := 1;     //工序归 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end
          else    //下一个是R型                【无误】
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //选L边
          //测试
            if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin       //开辟新站直接放
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else  //下一个是L型               【无误】
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //选R边
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else                   //E型  同站  左边快于右边   【无误】
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
          begin          //同一站，右边比左边快，才判断
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
            ;
            //E型  同站   有约束  但没约束到    [【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin        //E型  同站  无约束  放右边 [无误] 【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //右边快于左边                  【无误】
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
          begin    //直接将E放到  有约束的一边
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else     //小空间放不下，大的也不，跳出
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  型  同站  有约束  没约束到  直接放左边  【无误】
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end          //无约束，放空间大的左边
          else                                //【无误】
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
        end
      end
      else if P_zuo > P_you then   //左边快于右边  //放右边看看放得下不
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin // 快一个站 不需要检测前序**
            begin
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //下标递增
                goto 86;
              end
              else     //小空间放不下，大的也不，跳出
              begin
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //下标递增
                goto 86;
              end;
            end;
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //直到查找到同站  同站单独查找  终止准则不一样
                 //同一站                       【无误】
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].zuoBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            //E型  同站   有约束  但没约束到       【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else
        begin        //E型  同站  无约束  放右边 [无误]【无误】
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if P_zuo < P_you then   //右边快于左边    //右边有约束  放右边  //没有约束放左边
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin                //快一个站  不需要检测前序
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //下标递增
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //直到查找到同站  同站单独查找  终止准则不一样
               //同一站                           【无误】
        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //直接将E放到  有约束的一边
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else     //小空间放不下，大的也不，跳出
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu - 1];
            ;
            //E  型  同站  有约束  没约束到  直接放左边
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end          //无约束，放空间大的左边
          else
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
        end
        else
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //下标递增
            goto 86;
          end
          else     //小空间放不下，大的也不，跳出
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //下标递增
            goto 86;
          end;
        end;
      end
    end
    else                                //【】
if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //【左边型工序】   //判右边是否约束
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian) then
      begin          //同一站，右边比左边快，才判断    【无误】
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
            Inc(num); //计算右边工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //下标递增
                goto 86;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          //可能无约束  直接放左边                  【无误】
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end   //无误
        else      //不存在前序  同站  直接放  左边
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if (P_zuo < P_you) then
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat      //并集不为空,含有前序,可能约束
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_zuo := back_P_you;  //直接跟上  会空出不少
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_zuo := back_P_you + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until back = 0;     //先查找快的站
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //直到查找到同站  同站单独查找  终止准则不一样

        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin          //同一站，右边比左边快，才判断
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;                          //当查找到右边比左边慢停止
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            //无约束  直接放左边
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else     //无前序  直接放
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //前序无  不查找  直接放左边
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else  //那就没有前序约束
      begin                   //wuwu    【无误】
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end
        else
        begin
          P_zuo := P_zuo + 1;
          L_gongxu := 1;
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end;
      end;
    end
    else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //【右边型工序】
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian) then
      begin
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
            Inc(num); //计算工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].ZUOBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu - 1]);
          // 有前序  无约束  直接放右边
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end
        else     //无约束
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end;
      end
      else if (P_you < P_zuo) then
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat      //并集不为空,含有前序,可能约束 //有误
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                P_you := back_P_zuo;
                R_gongxu := 1;
                if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;
            until back = 0;     //先查找快的站
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //直到查找到同站  同站单独查找  终止准则不一样
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin          //同一站，右边比左边快，才判断
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
            Inc(num); //计算右边工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
          //有前序  无约束  直接放
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end
        else
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end;
      end
      else         //【无误】
      begin
        if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //下标递增
          goto 86;
        end
        else
        begin
          P_you := P_you + 1;
          ;
          R_gongxu := 1;
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //下标递增
          goto 86;
        end;
      end;
    end;
86:
    b := b + 1;  //继续分配
    erro_x := 0;
    if (P_you > zhanNumber) or (P_zuo > zhanNumber) then
    begin       //不可行排序
      bad_matrix();
      erro_x := 1;
      goto 3;
    end;
  until b = n_guimo + 1;  //左右都满 //本配对站已满
  for a := 1 to zhannumber do  //解码成功 计算没对站的完工时间
  begin
    if (kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian) then
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
  end;
3:  //解码结束，不成功

end;
//EDA解码

procedure TForm1.EDA_decode_dir(var ind: integer);
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //本站满标志
  Rzanman: integer;   //右边一次放不下标志
  Lzanman: integer;   //右边一次放不下标志
  duimianyueshu: Integer;  //对面约束标志   1为存在约束
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //序列位置下标
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
  back: Integer;
  back_P_you, back_P_zuo: Integer; //回溯用
  i: Integer;
  num: Integer;
label
  1;
label
  3; //超出站数目，无效解，跳出
label
  2;
label
  4;
label
  5;
label
  86; //分配后跳出
begin

  kexingjiepop[ind] := kexingjiepop[101];    // 清空
  P_zuo := 1;     //站点归一
  P_you := 1;
  L_gongxu := 1;  //站内序归一
  R_gongxu := 1;
  b := 1;
  repeat  //基于工序循环分配
    if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
    begin     //E型工序
      if (P_zuo = P_you) and (P_you <> zhannumber) then    //左右站在同一位置
      begin
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //两边空闲相等    【改为下一个非约束的对面，如果约束放同一边】
          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //下一个也是E型  //默认左边
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //满足CT则
            begin    //判满足CT否         //【无误】
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //工序位置递增
              goto 86;
            end
            else   //放到下一个站
            begin           //wuwu            【无误】
              P_zuo := P_zuo + 1;  //站递增
              L_gongxu := 1;     //工序归 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end
          else    //下一个是R型(如果不是前序约束可放对面)  【已改】              【无误】
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //选L边
          //测试
            if not EdaFeasibleSolution[ind].gongxu[b].xu in gongxuset[EdaFeasibleSolution[ind].gongxu[b + 1].xu].aset then
            begin
              if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end
              else
              begin       //开辟新站直接放
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end;
            end
            else  //后序是本工序的后序约束
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end;
            end;
          end
          else  //下一个是L型               【无误】
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //选R边
            if not EdaFeasibleSolution[ind].gongxu[b].xu in gongxuset[EdaFeasibleSolution[ind].gongxu[b + 1].xu].aset then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end;
            end
            else
            begin
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end
              else
              begin       //开辟新站直接放
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end;
            end;
          end;
        end
        else                   //E型  同站  左边快于右边  【直接放到空间的一边，此时不关系空隙】 【无误】
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
          begin          //同一站，右边比左边快，才判断
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat                       // 【改为右边】
              if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
            //E型  同站   有约束  但没约束到    [【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin        //E型  同站  无约束  放右边 [无误] 【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //右边快于左边    【放左边】              【无误】
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
          begin    //直接将E放到  有约束的一边
            num := 0;                     // 【改】
            for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else     //小空间放不下，大的也不，跳出
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  型  同站  有约束  没约束到  直接放左边  【无误】
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end          //无约束，放空间大的左边
          else                                //【无误】
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
        end
      end
      else if (P_zuo > P_you) then   //左边快于右边  //放右边看看放得下不
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin          //同一站，右边比左边快，才判断
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat                       // 【改为右边】
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_you := back_P_zuo;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  if (back_P_zuo <> zhannumber) then
                  begin
                    P_you := back_P_zuo + 1;
                    R_gongxu := 1;
                    kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1;
                    goto 86;
                  end
                  else   //最后一站约束又放不下【3.21】
                  begin
                    P_you := back_P_zuo;
                    R_gongxu := 1;
                    kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //下标递增
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until (back = 0);
            ;  //【******貌似不对****】
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //直到查找到同站  同站单独查找  终止准则不一样
                 //同一站                       【无误】
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            //E型  同站   有约束  但没约束到       【无误】
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else
        begin        //E型  同站  无约束  放右边 [无误]【无误】
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if P_zuo < P_you then   //右边快于左边    //右边有约束  放右边  //没有约束放左边
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //直接将E放到  有约束的一边
            num := 0;                     // 【改】
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                P_zuo := back_P_you;
                L_gongxu := 1;
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else     //小空间放不下，大的也不，跳出
                begin
                  if P_zuo <> zhannumber then
                  begin
                    P_zuo := P_zuo + 1;
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1;
                    goto 86;
                  end
                  else
                  begin
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //下标递增
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until (back = 0); //【****貌似不对**】
          end;          //无约束，放空间大的左边
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //直到查找到同站  同站单独查找  终止准则不一样
               //同一站                           【无误】
        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //直接将E放到  有约束的一边
            num := 0;                     // 【改】
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else     //小空间放不下，大的也不，跳出
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  型  同站  有约束  没约束到  直接放左边  【无误】
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end          //无约束，放空间大的左边
          else
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end
            else     //小空间放不下，大的也不，跳出
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
        end
        else
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //下标递增
            goto 86;
          end
          else     //小空间放不下，大的也不，跳出
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //下标递增
            goto 86;
          end;
        end;
      end
    end
    else                                //【】
if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //【左边型工序】   //判右边是否约束
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian) then
      begin          //同一站，右边比左边快，才判断    【无误】
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
            Inc(num); //计算右边工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                if P_zuo <> ZHANNUMBER then
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          //可能无约束  直接放左边                  【无误】
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            if P_zuo <> ZHANNUMBER then
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end   //无误
        else      //不存在前序  同站  直接放  左边
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            if P_zuo <> ZHANNUMBER then
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end;
      end
      else if (P_zuo < P_you) then
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat      //并集不为空,含有前序,可能约束
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_zuo := back_P_you;  //直接跟上  会空出不少
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  if back_P_you <> zhannumber then
                  begin
                    P_zuo := back_P_you + 1;
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //下标递增
                    goto 86;
                  end
                  else
                  begin
                    P_zuo := back_P_you;  //直接跟上  会空出不少
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //下标递增
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until back = 0;     //先查找快的站
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //直到查找到同站  同站单独查找  终止准则不一样

        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin          //同一站，右边比左边快，才判断
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
              back := back - 1;                          //当查找到右边比左边慢停止
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            //无约束  直接放左边
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else     //无前序  直接放
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //前序无  不查找  直接放左边
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else  //那就没有前序约束
      begin                   //wuwu    【无误】
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end
        else
        begin
          P_zuo := P_zuo + 1;
          L_gongxu := 1;
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end;
      end;
    end
    else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //【右边型工序】
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian) then
      begin
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
            Inc(num); //计算工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].ZUOBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                if P_you <> zhannumber then
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu - 1]);
          // 有前序  无约束  直接放右边
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin

            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end
        else     //无约束
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            if P_you <> zhannumber then
            begin
              P_you := P_you + 1;
              ;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //下标递增
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //下标递增
              goto 86;
            end;
          end;
        end;
      end
      else if (P_you < P_zuo) then
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //计算右边工序的个数
            back := num;  //向前回溯
            repeat      //并集不为空,含有前序,可能约束 //有误
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //当出现约束停止
                P_you := back_P_zuo;
                R_gongxu := 1;
                if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //下标递增
                  goto 86;
                end
                else
                begin
                  if P_you <> zhannumber then
                  begin
                    P_you := P_you + 1;
                    R_gongxu := 1;
                    kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //下标递增
                    goto 86;
                  end
                  else
                  begin
                    kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //下标递增
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until back = 0;     //先查找快的站
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //直到查找到同站  同站单独查找  终止准则不一样
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin          //同一站，右边比左边快，才判断
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
            Inc(num); //计算右边工序的个数
          back := num;  //向前回溯
          repeat
            if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //当出现约束停止
              if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //下标递增
                goto 86;
              end;
            end;
            back := back - 1;                          //当查找到右边比左边慢停止
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
          //有前序  无约束  直接放
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end
        else
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //下标递增
            goto 86;
          end;
        end;
      end
      else         //【无误】
      begin
        if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //下标递增
          goto 86;
        end
        else
        begin
          P_you := P_you + 1;
          ;
          R_gongxu := 1;
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //下标递增
          goto 86;
        end;
      end;
    end;
86:
    b := b + 1;  //继续分配
  until b = n_guimo + 1;  //左右都满 //本配对站已满
  for a := 1 to zhannumber do  //解码成功 计算没对站的完工时间
  begin
    if (kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian) then
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
  end;
3:  //解码结束，不成功

end;

//CR-EDA评价部分
procedure TForm1.EDA_evaluate(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp

  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //采样环节不贪婪选择
  //利用站内实际工作时间作为目标再平衡 //计算平滑指数SI
  for A := 1 to zhannumber do //计算每个站的实际工作时间
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //左边
    repeat
      Light[A] := Light[A] + jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //右边
    repeat
      Right[A] := Right[A] + jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;
  MAX_T := Max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;
  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  //计算总空闲时间
  jiepop[ind].Acc_t:= zhannumber*2*MaxT-Total_process_time;
  oldjiepop[ind]:=jiepop[ind]
end;

procedure TForm1.EDA_evaluate2(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  if  Quick_evaluation_ind=0 then
  begin
    MaxT := 0;
    for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
    MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
    for b := 2 to zhannumber do      //计算最大站完工时间
    begin
      if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
      begin
        MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
      end;
    end;
    if MaxT = 0 then
    begin
      MaxT := 0;
    end;
    kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
    jiepop[ind].CTp := kexingjiepop[ind].CTp;
    //计算SI
    for A := 1 to zhannumber do //计算每个站的实际工作时间
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //左边
      repeat
        Light[A] := Light[A] + jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //右边
      repeat
        Right[A] := Right[A] + jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end;
    end;
    MAX_T := Max(Light_max, Right_max);
    LSI := 0;
    for A := 1 to zhannumber do
    begin
      LSI := LSI + Sqr(MAX_T - Light[A]);
      LSI := LSI + Sqr(MAX_T - Right[A]);
    end;
    LSI := Sqrt((LSI) / (2 * zhannumber));
    jiepop[ind].LSI := LSI;   //得到SI
    //以SI为二级评价
    if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then
    begin
      if jiepop[ind].LSI < oldjiepop[ind].LSI then
      begin
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else
      begin
        jiepop[ind] := oldjiepop[ind];
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;
    end
    else
    if (iteration > 0) and (oldjiepop[ind].CTp <= jiepop[ind].CTp) then  //换回去
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //新解更好  备份old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  begin
    jiepop[ind]:=oldjiepop[ind];
    kexingjiepop[ind]:=oldkexingjiepop[ind];
  end;
end;
procedure TForm1.EDA_evaluate3(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  if Quick_evaluation=0 then //快评
  begin
    MaxT := 0;
    for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
    MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
    for b := 2 to zhannumber do      //计算最大站完工时间
    begin
      if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
      begin
        MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
      end;
    end;
    if MaxT = 0 then
    begin
      MaxT := 0;
    end;
    kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
    jiepop[ind].CTp := kexingjiepop[ind].CTp;
    //计算SI
    for A := 1 to zhannumber do //计算每个站的实际工作时间
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //左边
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //右边
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end;
    end;
    MAX_T := Max(Light_max, Right_max);
    LSI := 0;
    for A := 1 to zhannumber do
    begin
      LSI := LSI + Sqr(MAX_T - Light[A]);
      LSI := LSI + Sqr(MAX_T - Right[A]);
    end;
    LSI := Sqrt((LSI) / (2 * zhannumber));
    jiepop[ind].LSI := LSI;   //得到SI
    //以SI为二级评价
    if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then
    begin
      if jiepop[ind].LSI < oldjiepop[ind].LSI then
      begin
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else
      begin
        jiepop[ind] := oldjiepop[ind];
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;
    end
    else
    if (iteration > 0) and (oldjiepop[ind].CTp <= jiepop[ind].CTp) then  //换回去
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //新解更好  备份old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  begin
    jiepop[ind]:=oldjiepop[ind];
    kexingjiepop[ind]:=oldkexingjiepop[ind];
  end;
end;
//对EDA种群按节拍由小到大排序

procedure TForm1.EDA_maopao();
var
  i, j, k: integer;
  temp: structure_jiepop;
  temp1: structure_kexingjiePOP;
  ind: Integer;
begin
  for i := (popsize - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                         //升序
      if jiepop[j].CTp > jiepop[j + 1].CTp then
      begin
        temp := jiepop[j];
        jiepop[j] := jiepop[j + 1];
        jiepop[j + 1] := temp;

        temp1 := kexingjiepop[j];
        kexingjiepop[j] := kexingjiepop[j + 1];
        kexingjiepop[j + 1] := temp1;
      end;
    end;
  end;
  for ind :=1 to popsize do
  begin
    oldjiepop[ind]:=jiepop[ind];
    oldkexingjiepop[ind]:=kexingjiepop[ind];
  end;
end;

procedure TForm1.maopao_samplepop();
var
  i, j, k: integer;
  temp: structure_jiepop;
  temp1: structure_kexingjiePOP;
begin
  for i := (99) downto 1 do
  begin
    for j := 1 to i do
    begin                         //升序
      if Sample_jiepop[j].CTp > Sample_jiepop[j + 1].CTp then
      begin
        temp := Sample_jiepop[j];
        Sample_jiepop[j] := Sample_jiepop[j + 1];
        Sample_jiepop[j + 1] := temp;

        temp1 := sample_kexingjiepop[j];
        sample_kexingjiepop[j] := sample_kexingjiepop[j + 1];
        sample_kexingjiepop[j + 1] := temp1;
      end;
    end;
  end;
end;
//利用种群前30%个体更新概率模型
//增量学习方式

procedure TForm1.EDAModel_update();
var
  a, b, c: integer;
  add: array[1..250] of array[1..250] of integer;
  ind: integer;
  xi: integer;
  x, y: integer;
  num: Integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      add[a, b] := 0;
    end;           //  trunc(yita*popsize)+1
  num := 0;
  for ind := 1 to Trunc(yita * popsize) + 1 do
  begin
    if jiepop[ind].ctp <= (CT * 1.1) then
    begin
      for xi := 1 to n_guimo do      //xi在某位置出现的次数
      begin
        add[jiepop[ind].gongxu[xi].xu, xi] := add[jiepop[ind].gongxu[xi].xu, xi] + 1;
      end;
      num := num + 1;
    end;
  end;         //代代累计概率值
  if num > 0 then
  begin
    for x := 1 to n_guimo do
    begin
      for y := 1 to n_guimo do
      begin
        if local_matrix[x, y] <> 0 then
        begin                                                    //3表示精英种群
          local_matrix[x, y] := TRUNC(((1 - aerfa) * local_matrix[x, y] + ((aerfa * add[x, y]) / (num))) * 1000) / 1000;
          if local_matrix[x, y] = 0 then                            //yita*popsize
          begin
            local_matrix[x, y] := 0.1;
          end;
        end;
      end;
    end;
  end;
end;

//每次出现优秀个体更新一次矩阵
procedure TForm1.EDA_update_M();
var
  a, b, c: integer;
  sum_crow:array [1..250]of Double;
begin
  for a := 1 to n_guimo do  //1.累计各列和
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a := 1 to n_guimo do
  begin
    local_matrix[bestjie.gongxu[a].xu,a]:=local_matrix[bestjie.gongxu[a].xu,a]+aerfa*sum_crow[a];
  end;
  for a := 1 to n_guimo do    //再次累计列和，归一化
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a :=1 to n_guimo do      //归一化
  begin
    for b := 1 to n_guimo do
    begin
      local_matrix[b,a]:= local_matrix[b,a]/sum_crow[a];
      if local_matrix[b,a]<0.0001then
      begin
        local_matrix[b,a]:=0.0001;
      end;
    end;
  end;
end;

//每次出现优秀个体更新一次矩阵
procedure TForm1.EDA_update();
var
  a, b, c: integer;
  sum_crow:array [1..250]of Double;
begin
  for a := 1 to n_guimo do  //1.累计各列和
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a := 1 to n_guimo do
  begin
    local_matrix[bestjie.gongxu[a].xu,a]:=local_matrix[bestjie.gongxu[a].xu,a]+aerfa*sum_crow[a];
  end;
  for a := 1 to n_guimo do    //再次累计列和，归一化
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a :=1 to n_guimo do      //归一化
  begin
    for b := 1 to n_guimo do
    begin
      local_matrix[b,a]:= local_matrix[b,a]/sum_crow[a];
      if local_matrix[b,a]<0.0001then
      begin
        local_matrix[b,a]:=0.0001;
      end;
    end;
  end;
end;
//模型生成新种群

procedure TForm1.BAS_sample();  //【跟形成初始解的代码相同】
var
  a, b, c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;
  jiepop[ind] := jiepop[102];
  for b := 0 to n_guimo do   //位置        //备份模型，防止破坏
  begin
    for c := 0 to n_guimo do   //工序
    begin
      TwoMatrix[b, c] := Local_Matrix[b, c];
    end;
  end;

  for b := 1 to n_guimo do    //序长度
  begin             //jiepop101动态变化   102固定不变
    for c := 1 to n_guimo do
    begin           //依次判断是否满足前序约束
      if Local_Matrix[c, b] <> 0 then       //=0说明该工序在该位置不可能
      begin         //c表示序的下标      //[行,列]
        d := 1;
        repeat
          if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
          begin    //有前序未安排
            Local_Matrix[c, b] := 0;  //该位置置零 //记得恢复
            goto 3;                //跳出遍历
          end;
          d := d + 1;
        until jiepop[102].gongxu[c].qianxu[d] = 0; //遍历该工序的所有直接前序
      end;
3:

    end;           //得到部分位置更新清零后的model

    begin //在该列中轮盘赌选择
      psum := 0;
      e := 0;
      for d := 1 to n_guimo do
      begin
        pind[d, 1] := 0;
        pind[d, 2] := 0;
      end;
      for d := 1 to n_guimo do
      begin
        if Local_Matrix[d, b] <> 0 then
        begin
          e := e + 1;
          psum := psum + Local_Matrix[d, b];
          pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //累计概率值
          pind[e, 2] := d;    //记录概率的位置
          pind[e + 1, 2] := 0;  //结束查找标志
        end;
      end;
      numR := (random(trunc(psum * 100)) / 100); //生成区间内随机数
      e := 1;
      repeat
        if pind[e, 1] > numR then
        begin
          jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
          if trunc(jiepop[ind].gongxu[b].xu) = 0 then
          begin
            memo1.lines.add('序列填充为0');
          end;
          jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //更新工序状态
          for d := 1 to n_guimo do
          begin        //采样模型更新
            Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
          end;
          goto 5;
        end;
        e := e + 1;
      until pind[e, 2] = 0;
5:

    end;
  end;
  for b := 1 to n_guimo do
  begin
    for c := 1 to n_guimo do
    begin    //复原矩阵
      Local_Matrix[b, c] := TwoMatrix[b, c];
    end;
  end;
   //复原数据集
  jiepop[101] := jiepop[102];
end;
//模型生成新种群

procedure TForm1.EDAModeL_sample();  //【跟形成初始解的代码相同】
var
  a, b, c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;  //1-100全部采样生成
  repeat
    jiepop[ind] := jiepop[102];
    oldjiepop[ind] := jiepop[102];
    for b := 0 to n_guimo do   //位置        //备份模型，防止破坏
    begin
      for c := 0 to n_guimo do   //工序
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;

    for b := 1 to n_guimo do    //序长度
    begin             //jiepop101动态变化   102固定不变
      for c := 1 to n_guimo do
      begin           //依次判断是否满足前序约束
        if Local_Matrix[c, b] <> 0 then       //=0说明该工序在该位置不可能
        begin         //c表示序的下标      //[行,列]
          d := 1;
          repeat
            if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //有前序未安排
              Local_Matrix[c, b] := 0;  //该位置置零 //记得恢复
              goto 3;                //跳出遍历
            end;
            d := d + 1;
          until jiepop[102].gongxu[c].qianxu[d] = 0; //遍历该工序的所有直接前序
        end;
3:

      end;           //得到部分位置更新清零后的model

      begin //在该列中轮盘赌选择
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //累计概率值
            pind[e, 2] := d;    //记录概率的位置
            pind[e + 1, 2] := 0;  //结束查找标志
          end;
        end;
        numR := (random(trunc(psum * 100)) / 100); //生成区间内随机数
        e := 1;
        repeat
          if pind[e, 1] > numR then
          begin
            jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if trunc(jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('序列填充为0');
            end;
            jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //更新工序状态
            for d := 1 to n_guimo do
            begin        //采样模型更新
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end;
    end;

    DABC_decode(ind);
    DABC_evaluate(ind);

    ind := ind + 1;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //复原矩阵
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
     //复原数据集
    jiepop[101] := jiepop[102];

  until ind = popsize + 1;

end;
//不考虑工序相关性直接采样

procedure TForm1.EDA1_sample();
var
  a, b, c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;  //1-100全部采样生成
  repeat
    jiepop[ind] := jiepop[197];    //清空
    oldjiepop[ind] := jiepop[197];  //清空
    for b := 0 to n_guimo do   //备份  位置矩阵
    begin
      for c := 0 to n_guimo do   //工序
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;

    for b := 1 to n_guimo do    //序长度
    begin             //jiepop200动态变化   199固定不变
      begin //在该列中轮盘赌选择
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            if e > 1 then
            begin
              pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //累计概率值
            end
            else if e = 1 then
            begin
              pind[e, 1] := Local_Matrix[d, b];
            end;
            pind[e, 2] := d;    //记录概率的位置
            pind[e + 1, 2] := 0;  //结束查找标志
          end;
        end;
        numR := RandomRange(0, trunc(psum * 100)) / 100; //生成区间内随机数

        e := 1;
        repeat
          if (pind[e, 1] > numR) then
          begin
            jiepop[ind].gongxu[b] := jiepop[199].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if (jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('序列填充为0');
            end;
            jiepop[200].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //更新工序状态
            for d := 1 to n_guimo do
            begin        //采样模型更新  //选完的行清零
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end;
    end;

    DABC_decode(ind);
    EDA_evaluate(ind);

    ind := ind + 1;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //复原矩阵
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
     //复原数据集
    jiepop[200] := jiepop[199];

  until ind = popsize + 1;
end;
//根据关系矩阵生成新个体
//选择矩阵+关系矩阵

procedure TForm1.EDA_sample();
var
  a, b, c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 1; //从1到pop全部替换
  repeat
    jiepop[ind] := jiepop[297];    //清空
    oldjiepop[ind] := jiepop[297];  //清空
    for b := 0 to n_guimo do   //备份  位置矩阵
    begin
      for c := 0 to n_guimo do   //工序
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;
    for b := 1 to n_guimo do    //序长度
    begin             //jiepop200动态变化   199固定不变
      for c := 1 to n_guimo do
      begin           //依次判断是否满足前序约束
        if Local_Matrix[c, b] <> 0 then       //=0说明该工序在该位置不可能
        begin         //c表示序的下标      //[行,列]
          d := 1;
          repeat
            if jiepop[300].gongxu[jiepop[299].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //有前序未安排
              Local_Matrix[c, b] := 0;  //该位置置零 //记得恢复
              goto 3;                //跳出遍历
            end;
            d := d + 1;
          until jiepop[299].gongxu[c].qianxu[d] = 0; //遍历该工序的所有直接前序
        end;
  3:
      end;           //得到部分位置更新清零后的model
      begin //在该列中轮盘赌选择
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            if e > 1 then
            begin
              pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //累计概率值
            end
            else if e = 1 then
            begin
              pind[e, 1] := Local_Matrix[d, b];
            end;
            pind[e, 2] := d;    //记录概率的位置
            pind[e + 1, 2] := 0;  //结束查找标志
          end;
        end;
        numR := RandomRange(0, trunc(psum * 100)) / 100; //生成区间内随机数
        e := 1;
        repeat
          if (pind[e, 1] > numR) then
          begin
            jiepop[ind].gongxu[b] := jiepop[299].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if (jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('序列填充为0');
            end;
            jiepop[300].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //更新工序状态
            for d := 1 to n_guimo do
            begin        //采样模型更新
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
  5:
      end;
    end;
    iteration:=0;  //为了解码
    EDA_decode(ind);  //完全解码
    EDA_evaluate(ind); //直评
    iteration:=1;

    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //复原矩阵
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
    jiepop[300] := jiepop[299];    //复原数据集
    ind:=ind+1;
  until ind = popsize+1;

//  min:=jiepop[301].ctp;
//  ind:=301; //选择的个体
//  for a := 301 to set3 do
//  begin
//    if (jiepop[a].ctp<min) then
//    begin
//      min:=jiepop[a].ctp;
//      ind:=a; //选择的个体
//    end;
//  end;
//  jiepop[301]:=jiepop[ind];
//  kexingjiepop[301]:=kexingjiepop[ind];
//
//  code_set:=[];
//  begin     //找到重复的一个  [有效]
//    for a := 1 to popsize do //跟后边的对比 //相当于一个冒泡算法  但是不需要走完
//    begin
//      for B := a + 1 to popsize do
//      begin
//        for c := 1 to n_guimo do
//        begin
//          if jiepop[a].gongxu[c].xu <> jiepop[B].gongxu[c].xu then
//            goto 7;
//        end;
//        if c = n_guimo + 1 then  //说明全部工序相等  重复了
//        begin
//          code_set := code_set + [a];
//          jiepop[a] := jiepop[301];
//          kexingjiepop[a] := kexingjiepop[301];  //【替换个体】
//          oldjiepop[a] := jiepop[301];
//          oldkexingjiepop[a] := kexingjiepop[301];
//          goto 8;
//        end;
//        7: //方案不重复直接跳出
//      end;
//    end;
//    begin     //如果没有重复方案则找种群中最差个体
//      maxT := jiepop[1].CTp;
//      big_ind := 1;
//      for d := 1 to popsize do
//      begin
//        if jiepop[d].CTp > maxT then
//        begin
//          maxT := jiepop[d].CTp;
//          big_ind := d;
//        end
//      end;    //jiepop[index2] 是种群中最差的个体
//      code_set := code_set + [big_ind];
//      jiepop[big_ind] := jiepop[301];
//      oldjiepop[big_ind] := jiepop[301];
//      kexingjiepop[big_ind] := kexingjiepop[301];  //【替换个体】
//      oldkexingjiepop[big_ind] := kexingjiepop[301];
//    end;
//    8: //有重复方案直接跳出
//  end;
end;
procedure TForm1.EDA_Set_replace();
var
  a,c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
  weizhi1,weizhi2:Integer;
  b:structure_gongxu;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 201;
  repeat
    jiepop[ind] := jiepop[197];    //清空
    oldjiepop[ind] := jiepop[197];  //清空

    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //随机打乱次数
    begin
      weizhi1 := 1;
      weizhi2 := 1;
      while (weizhi1 = weizhi2) do //选取两个不同的点
      begin
        weizhi1 := RandomRange(1, n_guimo);
        weizhi2 := RandomRange(1, n_guimo);
      end;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    jiepop[ind]:=jiepop[200];
    iteration:=0;  //为了解码
    EDA_decode(ind);
    EDA_evaluate(ind); //直评
    iteration:=1;

    ind:=ind+1;
  until ind = set3+1;  //算例规模向上取整
  min:=jiepop[201].ctp;
  ind:=201; //选择的个体
  for a := 201 to set3 do
  begin
    if (jiepop[a].ctp<min) then
    begin
      min:=jiepop[a].ctp;
      ind:=a; //选择的个体
    end;
  end;
  jiepop[201]:=jiepop[ind];
  if min=0 then
  begin
    a:=1;
  end;
  if jiepop[201].gongxu[1].xu=0 then
  begin
    a:=1;
  end;
  begin     //找到重复的一个  [有效]
    for a := 1 to popsize do //跟后边的对比 //相当于一个冒泡算法  但是不需要走完
    begin
      for d := a + 1 to popsize do
      begin
        for c := 1 to n_guimo do
        begin
          if jiepop[a].gongxu[c].xu <> jiepop[d].gongxu[c].xu then
            goto 7;
        end;
        if c = n_guimo + 1 then  //说明全部工序相等  重复了
        begin
          code_set := code_set + [a];
          jiepop[a] := jiepop[201];
          kexingjiepop[a] := kexingjiepop[201];  //【替换个体】
          oldjiepop[a] := jiepop[201];
          oldkexingjiepop[a] := kexingjiepop[201];
          goto 8;
        end;
        7: //方案不重复直接跳出
      end;
    end;
    begin     //如果没有重复方案则找种群中最差个体
      maxT := jiepop[1].CTp;
      big_ind := 1;
      for d := 1 to popsize do
      begin
        if jiepop[d].CTp > maxT then
        begin
          maxT := jiepop[d].CTp;
          big_ind := d;
        end
      end;    //jiepop[index2] 是种群中最差的个体
      code_set := code_set + [big_ind];
      jiepop[big_ind] := jiepop[201];
      oldjiepop[big_ind] := jiepop[201];
      kexingjiepop[big_ind] := kexingjiepop[201];  //【替换个体】
      oldkexingjiepop[big_ind] := kexingjiepop[201];
    end;
    8: //有重复方案直接跳出
  end;
end;
procedure TForm1.EDA_Rand_replace();
var
  a,c, d: Integer;
  dir: Integer;          //标志
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //优先安排工序列表
  numR: double;  //轮盘赌落点位置
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
  weizhi1,weizhi2:Integer;
  b:structure_gongxu;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 300;
  jiepop[ind] := jiepop[197];    //清空
  oldjiepop[ind] := jiepop[197];  //清空
  jiepop[200] := jiepop[199];
  for c := 1 to n_guimo do //随机打乱次数
  begin
    weizhi1 := 1;
    weizhi2 := 1;
    while (weizhi1 = weizhi2) do //选取两个不同的点
    begin
      weizhi1 := RandomRange(1, n_guimo);
      weizhi2 := RandomRange(1, n_guimo);
    end;
    b := jiepop[200].gongxu[weizhi1];
    jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
    jiepop[200].gongxu[weizhi2] := b;
  end;
  jiepop[ind]:=jiepop[200];
  begin
    iteration:=0;  //为了解码
    EDA_decode(ind);
    EDA_evaluate(ind); //直评
    iteration:=1;
  end;
  jiepop[300]:=jiepop[ind];
  begin     //找到重复的一个  [有效]
    for a := 1 to popsize do //跟后边的对比 //相当于一个冒泡算法  但是不需要走完
    begin
      for d := a + 1 to popsize do
      begin
        for c := 1 to n_guimo do
        begin
          if jiepop[a].gongxu[c].xu <> jiepop[d].gongxu[c].xu then
            goto 7;
        end;
        if c = n_guimo + 1 then  //说明全部工序相等  重复了
        begin
          code_set := code_set + [a];
          jiepop[a] := jiepop[300];
          kexingjiepop[a] := kexingjiepop[300];  //【替换个体】
          oldjiepop[a] := jiepop[300];
          oldkexingjiepop[a] := kexingjiepop[300];
          goto 8;
        end;
        7: //方案不重复直接跳出
      end;
    end;
    begin     //如果没有重复方案则找种群中最差个体
      maxT := jiepop[1].CTp;
      big_ind := 1;
      for d := 1 to popsize do
      begin
        if jiepop[d].CTp > maxT then
        begin
          maxT := jiepop[d].CTp;
          big_ind := d;
        end
      end;    //jiepop[index2] 是种群中最差的个体
      code_set := code_set + [big_ind];
      jiepop[big_ind] := jiepop[300];
      oldjiepop[big_ind] := jiepop[300];
      kexingjiepop[big_ind] := kexingjiepop[300];  //【替换个体】
      oldkexingjiepop[big_ind] := kexingjiepop[300];
    end;
    8: //有重复方案直接跳出
  end;
end;
//对前五个个体做

procedure TForm1.EDA_LS1();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //提取和插入位置
  line: string; //测试
  stop_insert: integer;  //禁止insert             copy保存  vns保存最优
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  ind: Integer;
  acc:Integer;
  num:Integer;
label
  2, 4, 5;
begin
  for ind := 1 to trunc(popsize * yita) do  //对前5%个体  LS
  begin
    for Time := 1 to 5 do
    begin
      acc:=0;
      a := RandomRange(1, n_guimo);  //随机位置
      point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
      best_ctp := jiepop[ind].CTp;
      num:=a;
      repeat        // 限制性 insert
        num:=num+1;
      until   (jiepop[ind].gongxu[num].xu in gongxuset[point1].bnearset)or(num=n_guimo) ;
      if (num-1)>a then //至少有一个点可插入
      begin
        b := RandomRange(a+1, num-1);  //这个提取点可以细化【！】
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
        for c := a + 1 to b do //片段覆盖
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入
        EDA_decode(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp <= CT)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI)) then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.CTp;
          EDA_SI := bestjie.LSI;
          acc:=0;
          Memo1.Lines.Add('LS1 向后 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI));
          goto 5;
        end
      end;
    end;

    for Time := 1 to 5 do
    begin      //向前insert
      acc:=0;
      a := RandomRange(2, n_guimo);
      point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
      best_ctp := jiepop[ind].CTp;
      num:=a;
      repeat        // 限制性 insert
        num:=num-1;
      until   (jiepop[ind].gongxu[num].xu in gongxuset[point1].anearset )or(num=1) ;
    //  if (num-1)<a then //至少有一个点可插入
      b := RandomRange(num+1,a-1 );  //这个提取点可以细化【！】
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      for c := a downto b do //片段覆盖
      begin
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
      end;
      jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入
      EDA_decode(ind);
      EDA_evaluate2(ind);
      if (jiepop[ind].CTp <= CT)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin
        CT := jiepop[ind].CTp - 1;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        acc:=0;
        Memo1.Lines.Add('LS1 向前 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI));
        goto 5;   //有好就跳出
      end
    end;
5:
  end;
end;
//历史最优做

procedure TForm1.EDA_LS2();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //提取和插入位置
  line: string; //测试
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
  ind: Integer; //储存最优解
  acc:Integer;
  num:Integer;
  times: Integer;
  flag:Integer;
  t:integer;
label 2, 4, 5;
begin
  for times := 1 to popsize do
  begin
    ind:=RandomRange(1,popsize+1);
    oldjie:=jiepop[ind];   //保存
    oldkxjie:=kexingjiepop[ind];
    flag:=0;
    acc:=0;
    t:=1;
    repeat
      a:=1;
      b:=1;
      while a=b do
      begin
        a:=randomrange(1,n_guimo);
        b:=randomrange(1,n_guimo);
      end;
      if (a<b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].bset) then    //后insert
      begin
        copyjie := jiepop[ind];
        for c := a + 1 to b do //片段覆盖
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //插入
        deepjie:= jiepop[ind];//deep所用
        EDA_decode2(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp <bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
        begin          //1.跟最优解比较
          if (jiepop[ind].CTp < bestjie.CTp) then
          begin
            CT := bestjie.CTp - 1;
          end;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          flag:=1;  //不需要deep标志
          EDA_update_M;
             //   savebestdate();
        //  Memo1.Lines.Add('LS2 向后 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc));
        end
        else        //2.跟自己比较
        if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
        begin
          flag:=1;  //不需要deep标志
        end
        else       //3.没有进展  做deep
        begin
          acc:=acc+1;  //做两次深入
          jiepop[ind]:=deepjie;
        end;
      end
      else
      if  (a>b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset) then     //前insert
      begin
        copyjie := jiepop[ind];
        for c := a downto b do //片段覆盖
        begin
          jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
        end;
        jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //插入
        EDA_decode2(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp < bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
        begin
          if (jiepop[ind].CTp < bestjie.CTp) then
          begin
            CT := bestjie.CTp - 1;
          end;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          flag:=1;  //不需要deep标志
          EDA_update_M;
            //    savebestdate();
        //  Memo1.Lines.Add('LS2 向前 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc));
        end
        else        //2.跟自己比较
        if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
        begin
          flag:=1;  //不需要deep标志
        end
        else       //3.没有进展  做deep
        begin
          acc:=acc+1;  //做两次深入
          jiepop[ind]:=deepjie;
        end;
      end;
      t:=t+1;
      if acc = 4 then
        a := 1;
    until (acc = deep1) or ( flag=1) or (t>n_guimo) ;
    if flag=0 then
    begin
      jiepop[ind]:=oldjie;   //保存
      kexingjiepop[ind]:=oldkxjie;
    end;
  end;
end;
procedure TForm1.EDA_LS3();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //提取和插入位置
  line: string; //测试
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
  ind: Integer; //储存最优解
  acc:Integer;
  num:Integer;
  times: Integer;
  flag:Integer;
  oldbest:Integer;
  t:integer;
label 1,2, 4, 5,6;
begin
  jiepop[300]:=bestjie;
  oldjiepop[300]:=jiepop[300];
  kexingjiepop[300]:=BestKexingjie;
  oldkexingjiepop[300]:=kexingjiepop[300];
  ind:=300;
  oldjie:=jiepop[ind];   //保存
  oldkxjie:=kexingjiepop[ind];
  flag:=0;
  acc:=0;
  oldbest:= bestjie.ctp;
  t:=1;
  repeat
    a:=1;
    b:=1;
    while a=b do
    begin
      a:=randomrange(1,n_guimo);
      b:=randomrange(1,n_guimo);
    end;
    if (a<b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].bset) then    //后insert
    begin
      copyjie := jiepop[ind];
      for c := a + 1 to b do //片段覆盖
      begin
        jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
      end;
      jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //插入
      deepjie:= jiepop[ind];//deep所用

//      EDA_decode2(ind);
//      EDA_evaluate2(ind);

      EDA_decode(ind);           //快评
      EDA_evaluate3(ind); //带贪婪的评价  快评

      if (jiepop[ind].CTp <bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin          //1.跟最优解比较
        if  (jiepop[ind].CTp <bestjie.CTp) then
        begin
         CT := bestjie.CTp - 1;
        end;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        EDA_CT := bestjie.ctp;
        EDA_SI := bestjie.LSI;
        flag:=1;  //不需要deep标志
//        EDA_update_M;
           //   savebestdate();
     //   Memo1.Lines.Add('LS3 向后 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'acc'+inttostr(acc)+'dep'+inttostr(D));
      end
      else        //2.跟自己比较
      if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
      begin
        flag:=1;  //不需要deep标志
      end
      else       //3.没有进展  做deep
      begin
        acc:=acc+1;  //做两次深入
        jiepop[ind]:=deepjie;
      end;
    end
    else
    if  (a>b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset) then     //前insert
    begin

      copyjie := jiepop[ind];
      for c := a downto b do //片段覆盖
      begin
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
      end;
      jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //插入

  //      EDA_decode2(ind);
  //      EDA_evaluate2(ind);

      EDA_decode(ind);           //快评
      EDA_evaluate3(ind); //带贪婪的评价  快评

      if (jiepop[ind].CTp < bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin
        if  (jiepop[ind].CTp <bestjie.CTp) then
        begin
         CT := bestjie.CTp - 1;
        end;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        EDA_CT := bestjie.ctp;
        EDA_SI := bestjie.LSI;
        flag:=1;  //不需要deep标志
//
           //   savebestdate();
      //  Memo1.Lines.Add('LS3 向前 FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc)+'dep'+inttostr(D));
      end
      else        //2.跟自己比较
      if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
      begin
        flag:=1;  //不需要deep标志
      end
      else       //3.没有进展  做deep
      begin
        acc:=acc+1;  //做两次深入
        jiepop[ind]:=deepjie;
      end;
    end;
    t:=t+1;
  until (acc = deep2) or ( flag=1)or (t>n_guimo) ;
  if flag=0 then   //没有进展还原
  begin
    jiepop[ind]:=oldjie;
    kexingjiepop[ind]:=oldkxjie;
  end;
end;
//对前五个个体做

procedure TForm1.EDA1_LS1(var ind: Integer);
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //提取和插入位置
  line: string; //测试
  stop_insert: integer;  //禁止insert             copy保存  vns保存最优
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
label
  2, 4, 5;
begin
  //向后insert     【无误】
  for Time := 1 to 20 do         //做五次
  begin
    a := RandomRange(1, n_guimo);  //随机位置

    point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
    copyjiepop[ind] := jiepop[ind];
    copykexingjiepop[ind] := kexingjiepop[ind];
    best_ctp := jiepop[ind].CTp;
    for b := a + 1 to n_guimo do //插入位置[b之后]   //每次都要把
    begin
      jiepop[ind] := copyjiepop[ind];    //不改变
      kexingjiepop[ind] := copykexingjiepop[ind];
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      begin
        for c := a + 1 to b do //片段覆盖
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入
        EDA_decode(ind);
        EDA_evaluate2(ind);
        if jiepop[ind].CTp <= CT then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          Memo1.Lines.Add('LS1 向后 FIND:' + IntToStr(EDA_CT));
          Memo1.Lines.Add('LS1 FIND:' + FloatToStr(EDA_SI));
          goto 5;
        end;
      end;
    end;
  end;
  for Time := 1 to 20 do
  begin
    //向前insert
    a := RandomRange(1, n_guimo);
    point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
    copyjiepop[ind] := jiepop[ind];
    copykexingjiepop[ind] := kexingjiepop[ind];
    best_ctp := jiepop[ind].CTp;
    for b := a - 1 downto 1 do //插入位置[b之前]
    begin
      jiepop[ind] := copyjiepop[ind];    //不改变
      kexingjiepop[ind] := copykexingjiepop[ind];
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      begin
        for c := a downto b do //片段覆盖
        begin
          jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入
        DABC_decode(ind);
        EDA_evaluate2(ind);
        if jiepop[ind].CTp <= CT then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          Memo1.Lines.Add('LS1 向前 FIND:' + IntToStr(EDA_CT));
          Memo1.Lines.Add('LS1 FIND:' + FloatToStr(EDA_SI));
          goto 5;
        end;
      end;
    end;
  end;
5:

end;
//历史最优做

procedure TForm1.EDA1_LS2(var ind: Integer);
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //提取和插入位置
  line: string; //测试
  stop_insert: integer;  //禁止insert             copy保存  vns保存最优
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
label
  2, 4;
begin
  //向后insert     【无误】
  for Time := 1 to insert_times do
  begin
    a := RandomRange(1, n_guimo - 1);
    begin
      point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
      begin
        copyjiepop[ind] := jiepop[ind];
        copykexingjiepop[ind] := kexingjiepop[ind];
        best_ctp := jiepop[ind].CTp;
        for b := a + 1 to n_guimo do //插入位置[b之后]
        begin
          jiepop[ind] := copyjiepop[ind];    //不改变
          kexingjiepop[ind] := copykexingjiepop[ind];
          oldjiepop[ind] := jiepop[ind];
          oldkexingjiepop[ind] := kexingjiepop[ind];
          begin
            for c := a + 1 to b do //片段覆盖
            begin
              jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
            end;
            jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入

            DABC_decode(ind);
            EDA_evaluate2(ind);
            if jiepop[ind].CTp <= CT then
            begin
              CT := jiepop[ind].CTp - 1;
              bestjie := jiepop[ind];
              BestKexingjie := kexingjiepop[ind];
      //          Memo1.Lines.Add('bestCT   '+FloatToStr(CT+1)+'    LS2');
            end;
          end;
        end;
      end;
    end;
  end;
  for Time := 1 to insert_times do
  begin
    //向前insert
    a := RandomRange(1, n_guimo - 1);
    begin
      point1 := jiepop[ind].gongxu[a].xu;  //提取的工序值
      copyjiepop[ind] := jiepop[ind];
      copykexingjiepop[ind] := kexingjiepop[ind];
      best_ctp := jiepop[ind].CTp;
      for b := a - 1 downto 1 do //插入位置[b之前]
      begin
        jiepop[ind] := copyjiepop[ind];    //不改变
        kexingjiepop[ind] := copykexingjiepop[ind];
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
        begin
          for c := a downto b do //片段覆盖
          begin
            jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
          end;
          jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //插入
          DABC_decode(ind);
          EDA_evaluate2(ind);
          if jiepop[ind].CTp <= CT then
          begin
            CT := jiepop[ind].CTp - 1;
            bestjie := jiepop[ind];
            BestKexingjie := kexingjiepop[ind];
    //        Memo1.Lines.Add('bestCT   '+FloatToStr(CT+1)+'    LS2')
          end;
        end;
      end;
    end;
  end;
end;

function TForm1.choose_direction(var ind: integer; pzhan: Integer): integer;  //返回  -1=左边  1=右边
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
label
  1;
begin
  endtime := 0;
  for A := 1 to n_guimo do
  begin
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          end
          else   //没约束到
          begin
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
    begin   //选
      L_NUM := 0;
      R_NUM := 0;
      for B := 1 to n_guimo do
      begin
        if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = -1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          Inc(L_NUM)
        else if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = 1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          Inc(R_NUM);
      end;
      if L_NUM > R_NUM then
      begin
        Result := -1;
      end
      else if L_NUM < R_NUM then
      begin
        Result := 1;
      end
      else if (L_NUM = R_NUM) and (R_NUM <> 0) then
      begin
        L_BSET := [];
        R_BSET := [];
        for B := 1 to n_guimo do
        begin
          if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = -1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          begin
            L_BSET := L_BSET + jiepop[ind].gongxu[B].bnearset;
          end
          else if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = 1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          begin
            R_BSET := R_BSET + jiepop[ind].gongxu[B].bnearset;
          end;
        end;

        for C in L_BSET do
          Inc(L_NUM);
        for C in R_BSET do
          Inc(L_NUM);

        if L_NUM >= R_NUM then    //【一处默认项】
        begin
          Result := -1;
        end
        else if L_NUM < R_NUM then
        begin
          Result := 1;
        end
      end;
    end;
1:

  end;
end;

function TForm1.BAS_choose_direction(var ind: Integer; pzhan: Integer): integer;  //返回  -1=左边  1=右边
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
label
  1, 2;
begin
  LA1 := [];
  LA2 := [];
  endtime := 0;
  for A := 1 to n_guimo do
  begin
    if (jiepop[ind].gongxu[A].fangxiang = -1) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          end
          else   //没约束到
          begin
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
1:

  end;

  for A := 1 to n_guimo do
  begin
    if (jiepop[ind].gongxu[A].fangxiang = 1) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 2; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          end
          else   //没约束到
          begin
            begin
              LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
2:

  end;

  begin   //选
    L_NUM := 0;
    R_NUM := 0;
    for B := 1 to n_guimo do
    begin
      if (jiepop[ind].gongxu[B].xu in LA1) and (jiepop[ind].gongxu[B].fangxiang = -1) then
        Inc(L_NUM)
      else if (jiepop[ind].gongxu[B].xu in LA2) and (jiepop[ind].gongxu[B].fangxiang = 1) then
        Inc(R_NUM);

    end;
    if L_NUM > R_NUM then
    begin
      Result := -1;
    end
    else if L_NUM < R_NUM then
    begin
      Result := 1;
    end
    else if (L_NUM = R_NUM) and (R_NUM <> 0) then
    begin
      L_BSET := [];
      R_BSET := [];
      for B := 1 to n_guimo do
      begin
        if (jiepop[ind].gongxu[B].xu in LA1) and (jiepop[ind].gongxu[B].fangxiang = -1) then
        begin
          L_BSET := L_BSET + jiepop[ind].gongxu[B].bnearset;
        end
        else if (jiepop[ind].gongxu[B].xu in LA2) and (jiepop[ind].gongxu[B].fangxiang = 1) then
        begin
          R_BSET := R_BSET + jiepop[ind].gongxu[B].bnearset;
        end;
      end;

      for C in L_BSET do
        Inc(L_NUM);
      for C in R_BSET do
        Inc(L_NUM);

      if L_NUM >= R_NUM then    //【一处默认项】
      begin
        Result := -1;
      end
      else if L_NUM < R_NUM then
      begin
        Result := 1;
      end
    end;
  end;
end;

procedure TForm1.bas_decode(var ind: Integer; dev: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
begin
  x := 1;
  kexingjiepop[ind] := kexingjiepop[300];  //随便去一个不用的数组
  oldkexingjiepop[ind] := kexingjiepop[ind];
  for zhan := 1 to zhannumber do
  begin
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1;   //新开辟站 工序号清0
    gx_R := 1;   //记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //空余时间
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Time_d := 10000; //最后一台无时间约束
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //空余时间
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
  end;
  for A := 0 to n_guimo do
    for B := 0 to n_guimo do
    begin
      Local_Matrix[A, B] := TwoMatrix[A, B];
    end;
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[300].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//[未完成]

procedure TForm1.Deviation_decode(var ind: Integer; dev: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
  deviation: Integer;  //累计偏差
  p: Integer;  //工序p
begin
  deviation := 0;  //累计偏差
  x := 1;
  kexingjiepop[ind] := kexingjiepop[201];
  oldkexingjiepop[ind] := kexingjiepop[ind];

  for zhan := 1 to zhannumber do
  begin
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1; //新开辟站 工序号清0
    gx_R := 1; //记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //空余时间
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Time_d := 10000; //最后一台无时间约束
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        begin
          Copykexingjiepop[ind] := kexingjiepop[ind];  //备份站内信息
          for A := 1 to n_guimo do         //只备份上一列
          begin
            copy_Matrix[A, x] := Local_Matrix[A, x];            //备份选择矩阵
          end;
        end;
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //空余时间

        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';

          p := BAS_L(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
            //只有放的下才会计算偏差
            deviation := deviation + kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 1] - kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 2] - jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[zhan].kexingGongxu[gx_L - 1]].shijian;
            if deviation > dev then    //超过允许范围  每个站只给dev  有个bug 会不会最优解是某个站dev很大   其他为0
            begin                     //先只考虑站内dev  跨站不考虑
              deviation := deviation - (kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 1] - kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 2] - jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[zhan].kexingGongxu[gx_L - 1]].shijian);
              x := x - 1;     //选择矩阵返回一行(不进入下一行)
              gx_L := gx_L - 1;
              kexingjiepop[ind] := Copykexingjiepop[ind];  //恢复站内信息
              jiepop[ind].gongxu[p].zhuangtai := 1;
              for B := 1 to n_guimo do                //恢复接序列的信息
              begin
                if jiepop[ind].gongxu[p].xu in jiepop[199].gongxu[B].aset then   //还原工序前序状态
                begin
                  jiepop[ind].gongxu[B].aset := jiepop[ind].gongxu[B].aset + [jiepop[ind].gongxu[p].xu];
                end;
              end;
              //并标记不可行路线  标记选择矩阵不可行点
              Local_Matrix[p, x] := 0;
            end
            else


          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
  end;
  for A := 0 to n_guimo do
    for B := 0 to n_guimo do
    begin
      Local_Matrix[A, B] := TwoMatrix[A, B];
    end;
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[200].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//改进解码：当左右边时间相同

procedure TForm1.DABC_decode_up(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
begin
  oldkexingjiepop[ind] := kexingjiepop[ind];
  kexingjiepop[ind] := kexingjiepop[197]; //清空站信息
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1; //新开辟站 工序号清0
    gx_R := 1; // 记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if L_R = 0 then
        begin
          L_R := choose_direction(ind, zhan);
        end;  //返回一个方向
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) then
        begin
          Rre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if L_R = 0 then
        begin
          L_R := choose_direction(ind, zhan);
        end;  //返回一个方向
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';
          Lre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) then
        begin
          Rre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;

        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[ind].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;

procedure TForm1.DABC_re_bestInd(var key: string);
var
  ind: Integer;
  MINCT:Integer;
  L2:Double;
begin
  minCT:=JIEPOP[1].CTp;
  L2:=JIEPOP[1].DABC_L2;
  for ind := 1 to popsize do
  begin
    if MINCT >= jiepop[ind].CTp then
    begin
      MINCT := jiepop[ind].CTp;
      DABC_CT:=jiepop[ind].CTp;
      L2:=JIEPOP[IND].DABC_L2;
      DABC_SI:=JIEPOP[IND].LSI;
      if L2<JIEPOP[IND].DABC_L2 then
      begin
        MINCT := jiepop[ind].CTp;
        DABC_CT:=jiepop[ind].CTp;
        L2:=JIEPOP[IND].DABC_L2;
        DABC_SI:=JIEPOP[IND].LSI;
      end;
    end;
  end;
end;

procedure TForm1.calculation_SI();
var
  a: Integer;
  MAXTIME: Integer;
  sumsqr: Integer;
begin
  MAXTIME := kexingjiepop[bestind].Station[1].OverTime;
  for a := 1 to zhannumber - 1 do
  begin
    if kexingjiepop[bestind].Station[a].OverTime > kexingjiepop[bestind].Station[a + 1].OverTime then
    begin
      MAXTIME := kexingjiepop[bestind].Station[a + 1].OverTime;
    end;
  end;
  sumsqr := 0;
  for a := 1 to zhannumber do
  begin
    sumsqr := sumsqr + Sqr(MAXTIME - kexingjiepop[bestind].Station[a].OverTime);
  end;
  SI := 0;
  SI := Sqrt(sumsqr);
end;
//站内重构策略的解码过程
//必须满足节拍约束
//因为是优化SI  不能以牺牲CT

procedure TForm1.Restructure_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string;    //方向
label
  1;  //回复工序性质
begin
  oldjiepop[ind] := jiepop[ind];
  oldkexingjiepop[ind] := kexingjiepop[ind];
  kexingjiepop[ind] := kexingjiepop[201]; //清空站信息
  zhan := 1;
  indexBack := 1;
  LCANT := 0;  //初始化站的状态
  RCANT := 0;
  gx_L := 1;   //新开辟站 工序号清0
  gx_R := 1;   // 记录站上工序的的序号
  zhan := 1;   //只用第一个站就可以了
  repeat
    L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
    Time_d := Abs(L_R);  //空余时间
    if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
    begin
      direction := 'L';
      Reconstruction_process_L(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
      if LCANT = 0 then
      begin
        RCANT := 0; //放一个新工序释放对面
      end;
    end
    else if (RCANT = 0) or (LCANT = 1) then
    begin
      direction := 'R';
      Reconstruction_process_R(ind, zhan, Time_d);  //函数  返回序  或者  0  放不下
      if RCANT = 0 then
      begin
        LCANT := 0;
      end;
    end;

    if (LCANT = 1) and (RCANT = 1) then
    begin
      indexBack := 0;
    end;
  until indexBack = 0;
  Refactoring_error := 0;
  for A := 1 to Number_operations do
  begin
    if jiepop[198].gongxu[A].zhuangtai = 1 then
    begin
      Refactoring_error := 1;
    end;
  end;

  for A := 1 to Number_operations do    //恢复工序的性质：状态、紧邻前序
  begin
    B := 1;
    repeat
      if jiepop[ind].gongxu[A].xu = Backup_process.gongxu[B].xu then
      begin
        jiepop[ind].gongxu[A] := Backup_process.gongxu[B];
        goto 1;
      end;
      B := B + 1;
    until Backup_process.gongxu[B].xu = 0;  //查找到末尾
1:

  end;
end;
//DABC作者版本解码

procedure TForm1.DABC_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
begin
  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[201]; //清空站信息
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1; //新开辟站 工序号清0
    gx_R := 1; // 记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          Rre_arr_back(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          Rre_arr_back(ind, zhan);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[ind].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//简化解码

procedure TForm1.EDA_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
  Total_idle_time:Integer;  //可利用的总空闲时间
  label 1;
begin
  Total_idle_time:=zhannumber*2*trunc(CT)-Total_process_time;//先计算在CT（还未达到）下可用的空闲时间
  Quick_evaluation:=0; //快评=0
  Acc_idle_time:=0;  //累计空闲时间=0

  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[297]; //清空站信息
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1; //新开辟站 工序号清0
    gx_R := 1; // 记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time>=Total_idle_time) then
        begin
          Quick_evaluation:=1;
          goto  1;
        end;
      until indexBack = 0;
      Acc_idle_time:=Acc_idle_time+(trunc(CT)-kexingjiepop[ind].zuoBianzhan[zhan].zongshijian);
      Acc_idle_time:=Acc_idle_time+(Trunc(CT)-kexingjiepop[ind].youBianzhan[zhan].zongshijian);
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  1:  //快速评价跳出
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[ind].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//普通解码
procedure TForm1.EDA_decode2(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //用哪个工序
  direction: string; //方向
  Total_idle_time:Integer;  //可利用的总空闲时间
  label 1;
begin
  Total_idle_time_ind:=zhannumber*2*trunc(jiepop[ind].CTp)-Total_process_time;//
  Quick_evaluation_ind:=0; //快评=0
  Acc_idle_time_ind:=0;  //累计空闲时间=0

  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[297]; //清空站信息
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //初始化站的状态
    RCANT := 0;
    gx_L := 1; //新开辟站 工序号清0
    gx_R := 1; // 记录站上工序的的序号
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time_ind>=Total_idle_time_ind) then
        begin
          Quick_evaluation_ind:=1;
          goto  1;
        end;
      until indexBack = 0;
    end
    else    //最后一个站之前
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);  //函数  返回序  或者  0  放不下
          if LCANT = 0 then
          begin
            RCANT := 0; //放一个新工序释放对面
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);  //函数  返回序  或者  0  放不下
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time_ind>=Total_idle_time_ind) then
        begin
          Quick_evaluation_ind:=1;
          goto  1;
        end;
      until indexBack = 0;
      Acc_idle_time_ind:=Acc_idle_time_ind+(trunc(jiepop[ind].CTp)-kexingjiepop[ind].zuoBianzhan[zhan].zongshijian);
      Acc_idle_time_ind:=Acc_idle_time_ind+(Trunc(jiepop[ind].CTp)-kexingjiepop[ind].youBianzhan[zhan].zongshijian);
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  1:
  for A := 1 to n_guimo do    //恢复工序的性质：状态、紧邻前序
  begin
    jiepop[ind].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
procedure TForm1.Lre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //【重点】
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //记录每个位置的时间
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  gx_L := gx_L + 1;
  //**其他需要可就行补充****
end;
//记录累计空闲时间

procedure TForm1.EDA_Refre_Lstation(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //【重点】
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //记录每个位置的时间
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  Acc_idle_time:= Acc_idle_time+ (endtime- kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L-1])-jiepop[ind].gongxu[a].shijian;
  Acc_idle_time_ind:= Acc_idle_time_ind+ (endtime- kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L-1])-jiepop[ind].gongxu[a].shijian;

  gx_L := gx_L + 1;
  //**其他需要可就行补充****


end;
procedure TForm1.EDA_Refre_Rstation(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //记录每个位置的时间
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  Acc_idle_time:= Acc_idle_time+ (endtime- kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R-1])-jiepop[ind].gongxu[a].shijian;
  Acc_idle_time_ind:= Acc_idle_time_ind+ (endtime- kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R-1])-jiepop[ind].gongxu[a].shijian;

  gx_R := gx_R + 1;
  //**其他需要可就行补充****
end;

//重构站的信息更新

procedure TForm1.Refactoring_information_update_L(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to Number_operations do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //【重点】
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //记录每个位置的时间
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  gx_L := gx_L + 1;
  //**其他需要可就行补充****
end;

procedure TForm1.Rre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //记录每个位置的时间
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  gx_R := gx_R + 1;
  //**其他需要可就行补充****
end;

procedure TForm1.Refactoring_information_update_R(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to Number_operations do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //记录每个位置的时间
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  gx_R := gx_R + 1;
  //**其他需要可就行补充****
end;

procedure TForm1.BAS_L_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[101].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[101].gongxu[a].xu in jiepop[101].gongxu[b].aset then
    begin
      jiepop[101].gongxu[b].aset := jiepop[101].gongxu[b].aset - [jiepop[101].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[101].gongxu[a].anearset <> []) then  //【重点】
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[101].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[101].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[101].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[101].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //记录每个位置的时间
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[101].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[101].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[101].gongxu[a].xu; //站上所有工序累计
  gx_L := gx_L + 1;
  //**其他需要可就行补充****
end;

procedure TForm1.BAS_R_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //状态：已分配
  for b := 1 to n_guimo do              //紧邻后序的前序集合中剔除该前序
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //站的时间
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //没约束到
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //记录每个位置的时间
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //站末尾工序内容
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //工序集合
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //站上所有工序累计
  gx_R := gx_R + 1;
  //**其他需要可就行补充****
end;

function TForm1.BAS_L(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := -1;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    if Local_Matrix[A, x] <> 0 then
    begin
      jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
      endtime := 0;
      if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[101].gongxu[A].aset = []) then
      begin              //放缩看时间约束
        if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
          begin
            BACK := gx_R - 1;
            repeat
              if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                  endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
                else
                  goto 1; //不满足
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
            if (endtime <> 0) and (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //没约束到
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              if (endtime <= CT) then
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
          end
        end
        else if pzhan = zhannumber then    //最后一台站的时间判定
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
          begin
            BACK := gx_R - 1;
            repeat
              if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
            if (endtime <> 0) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //没约束到
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
          end
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
1:

    end;
  end;

  if LA4 <> [] then
  begin
    A := choose_procedure(ind, LA4);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(ind, LA3);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(ind, LA2);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(ind, LA1);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end;

  if LA1 = [] then
  begin
    LCANT := 1;
  end
  else
  begin
    result := A;
  end;
end;

procedure TForm1.RE_MATRIXandJie(var ind: integer; p: Integer);
var
  B: Integer;
begin
  for B := 1 to n_guimo do
  begin
    Local_Matrix[p, B] := 0;
    if jiepop[ind].gongxu[B].aset <> [] then
    begin
      Local_Matrix[B, x + 1] := 0;  //下一行没有约束的扣为0
    end;
  end;
  x := x + 1;
end;

function TForm1.BAS_R(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    if Local_Matrix[A, x] <> 0 then
    begin
      jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
      endtime := 0;
      if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
      begin              //放缩看时间约束
        if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
          begin
            BACK := gx_L - 1;
            repeat
              if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                  endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
                else
                  goto 1;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
            if (endtime <> 0) and (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //没约束到
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              if (endtime <= CT) then
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
          end
        end
        else if pzhan = zhannumber then
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
          begin
            BACK := gx_L - 1;
            repeat
              if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
            if (endtime <> 0) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //没约束到
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
          end
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
1:  //因为CT不满足

    end;
  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(ind, LA4);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(ind, LA3);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(ind, LA2);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(ind, LA1);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end
  else
  begin
    result := A;
  end;
end;

procedure TForm1.Lre_arr_back(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
label
  3;
begin
  LCANT := 0;   //放满标志
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := -1;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // 优化
      begin
        if (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
        end;
      end;
    end;
1:

  end;
  if LA1 <> [] then   //优化时间
  begin
    if LA4 <> [] then     // 选择工序一定不能随机  不然打乱排序将没有意义
    begin               //选则找到的首个   当然可以在此处增加规则
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end;
  end
  else if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.Rre_arr_back(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := 0;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // 优化
      begin
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
    end;
1:  //因为CT不满足

  end;
  if LA1 <> [] then
  begin
    if LA4 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
  end
  else if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

procedure TForm1.EDA_CHOOSE_L_P(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
label
  3;
begin
  LCANT := 0;   //放满标志
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := -1;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // 优化
      begin
        if (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
        end;
      end;
    end;
1:

  end;
  if LA1 <> [] then   //优化时间
  begin
    if LA4 <> [] then     // 选择工序一定不能随机  不然打乱排序将没有意义
    begin               //选则找到的首个   当然可以在此处增加规则
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end;
  end
  else if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.EDA_CHOOSE_R_P(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := 0;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // 优化
      begin
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
        begin
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
        begin
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
    end;
1:  //因为CT不满足

  end;
  if LA1 <> [] then
  begin
    if LA4 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
  end
  else if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;
//重构策略  工序分配过程

procedure TForm1.Reconstruction_process_L(var ind: Integer; pzhan: Integer; TIME_D: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合

  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];

  earlytimeset := [];
  earlytime := -1;  //级别3
  for A := 1 to Number_operations do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT + 1) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT + 1 then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT + 1) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT + 1) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else
      begin
        goto 1;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT + 1) then                              //级别2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
      begin

        LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:

  end;
  if LA4 <> [] then
  begin
    num := 0;
    for A in LA4 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA4 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    num := 0;
    for A in LA3 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA3 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    num := 0;
    for A in LA2 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA2 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    num := 0;
    for A in LA1 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA1 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;
//重构工序分配  右边

procedure TForm1.Reconstruction_process_R(var ind: Integer; pzhan: Integer; TIME_D: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //级别3
  for A := 1 to Number_operations do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;

      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //级别3
      begin

        LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:  //因为CT不满足

  end;
  if LA4 <> [] then
  begin
    num := 0;
    for A in LA4 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA4 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    num := 0;
    for A in LA3 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA3 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    num := 0;
    for A in LA2 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA2 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    num := 0;
    for A in LA1 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //防止越界
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA1 then  //随机选择集合中数字
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

procedure TForm1.Lre_arr_back_1(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := -1;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //不满足
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //最后一台站的时间判定
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //【重点】
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then                 //级别3
      begin
        if earlytime = -1 then
        begin
          earlytime := jiepop[ind].gongxu[A].earlytime;
          earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
        end
        else
        begin
          if jiepop[ind].gongxu[A].earlytime < earlytime then
          begin
            earlytimeset := [];
            earlytimeset := [jiepop[ind].gongxu[A].xu];
            earlytime := jiepop[ind].gongxu[A].earlytime;
          end
          else if jiepop[ind].gongxu[A].earlytime = earlytime then
          begin
            earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
          end;
        end;
        LA3 := earlytimeset;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:

  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(pzhan, LA4);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(pzhan, LA3);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(pzhan, LA2);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(pzhan, LA1);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.Rre_arr_back_1(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //级别3
  for A := 1 to n_guimo do
  begin        //紧邻你前序为空&未分配          //未分配  并且前序已分配
    jiepop[ind].gongxu[A].earlytime := 0;  //级别3用
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //放缩看时间约束
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //级别1      放的下
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //没约束到
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //级别2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then                 //级别3
      begin
        if earlytime = 0 then
        begin
          earlytime := jiepop[ind].gongxu[A].earlytime;
          earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
        end
        else
        begin
          if jiepop[ind].gongxu[A].earlytime < earlytime then
          begin
            earlytimeset := [];
            earlytimeset := [jiepop[ind].gongxu[A].xu];
            earlytime := jiepop[ind].gongxu[A].earlytime;
          end
          else if jiepop[ind].gongxu[A].earlytime = earlytime then
          begin
            earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
          end;
        end;
        LA3 := earlytimeset;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //级别4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:  //因为CT不满足

  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(pzhan, LA4);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(pzhan, LA3);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(pzhan, LA2);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(pzhan, LA1);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

//变邻域插入方法局部搜【旁观蜂】
procedure TForm1.DABC_VNS();
var
  point1, point2, flag: Integer;
  a, b: Integer;
  Point3: Integer;
  scout: Integer;
  BCTin: Integer;
  coCTp: Integer;
  select: Integer;
label
  7;
begin
  select := RandomRange(1, popsize);
  coCTp := jiepop[select].CTp; //第一次插入
  repeat
    point1 := RandomRange(1, n_guimo);
    point2 := RandomRange(1, n_guimo);
    if point1 > point2 then //point1 在先  1插2
    begin
      flag := point1;
      point1 := point2;
      point2 := flag;
    end;
  until point1 <> point2;
  Copyjiepop[1].gongxu[1] := jiepop[select].gongxu[point1];  //【备份提取】
  for b := point1 to point2 - 1 do  //【片段迁移】
  begin
    jiepop[select].gongxu[b] := jiepop[select].gongxu[b + 1];
  end;
  jiepop[select].gongxu[point2] := Copyjiepop[1].gongxu[1]; //【插入】
  Copyjiepop[2] := jiepop[select]; //用这个再次插入
  DABC_decode(select);
  DABC_evaluate(select);
  if jiepop[select].CTp < BestCTP then
  begin
    BestCTP:= jiepop[select].CTp;
    CT:=bestCTp-1;
  //  Memo1.Lines.Add('旁观1find：' + inttostr(jiepop[select].CTp));
    DABC_SI := jiepop[select].LSI;
    DABC_CT := jiepop[select].CTp;
  end;
  if jiepop[select].CTp = coCTp then  //第二次插入
  begin
    jiepop[select] := Copyjiepop[2];
    point1 := point2;
    while point1 = point2 do
    begin
      point1 := RandomRange(1, n_guimo);
      point2 := RandomRange(1, n_guimo);
    end;
    if point1 > point2 then
    begin
      a := point1;
      point1 := point2;
      point2 := a;
    end;
    begin
      Copyjiepop[1].gongxu[1] := jiepop[select].gongxu[point1];  //【备份提取】
      for b := point1 to point2 - 1 do  //【片段迁移】
      begin
        jiepop[select].gongxu[b] := jiepop[select].gongxu[b + 1];
      end;
      jiepop[select].gongxu[point2] := Copyjiepop[1].gongxu[1]; //【插入】
      Copyjiepop[2] := jiepop[select]; //用这个再次插入
      DABC_decode(select);
      DABC_evaluate(select);   //评价过程  //贪婪选择过程
    end;
    if jiepop[select].CTp < BestCTP then
    begin
      BestCTP:= jiepop[select].CTp;
      CT:=bestCTp-1;
   //   Memo1.Lines.Add('旁观2find：' + inttostr(jiepop[select].CTp));
      DABC_SI := jiepop[select].LSI;
      DABC_CT := jiepop[select].CTp;
    end;
  end;
end;
//轮盘赌选择【旁观蜂】  [有效]

function TForm1.RouletteWheelSelection(): integer;
var
  b: Integer;
  CTpSum: Integer;
  Q: array[1..200] of Double;
  select, r, max: Integer;
begin
  //计算CTP概率
  CTpSum := 0;
  for b := 1 to popsize do
    CTpSum := CTpSum + kexingjiepop[b].CTp;

  for b := 1 to popsize do
    kexingjiepop[b].PCTp := (1 / (kexingjiepop[b].CTp)) / (1 / CTpSum); //取倒数求概率

  for b := 1 to popsize do
    if b = 1 then
      Q[b] := kexingjiepop[b].PCTp
    else
      Q[b] := Q[b - 1] + kexingjiepop[b].PCTp;

  max := Round(Q[popsize]); //取整

  r := RandomRange(1, max);
  for b := 1 to popsize do
    if Q[b] > r then
      Break;

  select := b;
  result := select;
end;

function TForm1.choose_procedure(var ind: Integer; LA: my_set): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //级别集合
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
  ceshi1: integer;
begin
  LA1 := [];
  LA2 := [];
  for A := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[A].xu in LA then
    begin
      if jiepop[ind].gongxu[A].fangxiang <> 0 then
      begin
        LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
      end
      else
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
  end;
  if LA1 <> [] then
  begin
    A := 0;
    repeat
      A := A + 1;
    until jiepop[ind].gongxu[A].xu in LA1;
    result := A;
  end
  else if LA2 <> [] then
  begin
    A := 0;
    repeat
      A := A + 1;
    until (jiepop[ind].gongxu[A].xu in LA2);
    result := A;
  end;
  if (LA1 = []) and (LA2 = []) then
  begin
    ceshi1 := 1;
  end;
  jiepop[1].gongxu[x] := jiepop[101].gongxu[A];  //到处解码的排序路线
end;

procedure TForm1.DABC_TP_PMX();
var
  flag1, flag2: Integer;
  a, b: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1, set2: set of 1..255;
  lab2: integer;
  flag: Integer;
  times: Integer;
begin

  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  set1 := [];
  set2 := [];

  copyjiepop[1] := jiepop[s1];
  Copyjiepop[2] := jiepop[s2];
  begin
    while p1 = p2 do             //选交叉位置
    begin
      p1 := RandomRange(1, n_guimo);
      p2 := RandomRange(1, n_guimo);
    end;
    if p1 > p2 then  //调整p1<p2
    begin
      mid := p1;
      p1 := p2;
      p2 := mid;
    end;
    set1 := [];
    set2 := [];
    for a := p1 to p2 do
    begin
      set1 := set1 + [jiepop[s1].gongxu[a].xu];
    end;
    for a := p1 to p2 do
    begin
      set2 := set2 + [jiepop[s2].gongxu[a].xu];
    end;
    for times := 1 to n_guimo do  //检测次数
    begin
      for a := p1 to p2 do
      begin
        if (not (jiepop[s1].gongxu[a].xu in set2)) or (not (jiepop[s2].gongxu[a].xu in set1)) then
        begin
          set1 := set1 - [jiepop[s1].gongxu[a].xu];
          set1 := set1 - [jiepop[s2].gongxu[a].xu];
          set2 := set2 - [jiepop[s1].gongxu[a].xu];
          set2 := set2 - [jiepop[s2].gongxu[a].xu];
        end;
      end;
    end;
    for a := p1 to p2 do
    begin
      if (jiepop[s1].gongxu[a].xu in set2) and (jiepop[s2].gongxu[a].xu in set1) then
      begin
        Temporary_storage := jiepop[s1].gongxu[a];
        jiepop[s1].gongxu[a] := jiepop[s2].gongxu[a];
        jiepop[s2].gongxu[a] := Temporary_storage;
      end;
    end;
  end;

  if (set1 <> []) and (set2 <> []) then
  begin
    //测试重复
    for a := 1 to n_guimo do
    begin
      b := a;
      repeat
        b := b + 1;
      until (b = n_guimo + 1) or (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu);
      if (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu) then
      begin
        flag1 := 1;
      end;
    end;
    DABC_decode(s1);
    DABC_evaluate(s1);
    if jiepop[s1].CTp <= CT then
    begin
      CT := jiepop[s1].CTp - 1;
      Memo1.Lines.Add('雇佣find：' + inttostr(jiepop[s1].CTp));
    end;
    DABC_decode(s2);
    DABC_evaluate(s2);
    if jiepop[s2].CTp <= CT then
    begin
      CT := jiepop[s2].CTp - 1;
      Memo1.Lines.Add('雇佣find：' + inttostr(jiepop[s2].CTp));
    end;
  end
  else
  begin
    jiepop[s1] := Copyjiepop[1];
    jiepop[s2] := Copyjiepop[2];
  end;
end;

procedure TForm1.DABC_PMX();
var
  flag1, flag2: Integer;
  a, b, c: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1, set2: set of 1..255;
  lab2: integer;
  flag: Integer;
  times: Integer;
label
  1;
label
  2;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  copyjiepop[1] := jiepop[s1];
  Copyjiepop[2] := jiepop[s2];
  while p1 = p2 do             //选交叉位置
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //调整p1<p2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  set2 := [];
  for a := 1 to p1 - 1 do     //s1的前端后端集合
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  for a := p2 + 1 to n_guimo do
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  for a := 1 to p1 - 1 do     //s2的前端后端集合
  begin
    set2 := set2 + [jiepop[s2].gongxu[a].xu];
  end;
  for a := p2 + 1 to n_guimo do
  begin
    set2 := set2 + [jiepop[s2].gongxu[a].xu];
  end;
  for a := p1 to p2 do   //做交叉
  begin
    gongxu := jiepop[s1].gongxu[a];
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[a];
    jiepop[s2].gongxu[a] := gongxu;
  end;
  for a := p1 to p2 do  //检测次数
  begin
    b := p1;
    repeat
      if jiepop[s1].gongxu[b].xu in set1 then //检测到重复
      begin
        gongxu := jiepop[s1].gongxu[b];
        goto 1;
      end;
      b := b + 1;
    until b = p2 + 1;   //很关键
1:
    c := p2;           //从后向前  不然变化不大
    repeat
      if jiepop[s2].gongxu[c].xu in set2 then //检测到重复
      begin
        jiepop[s1].gongxu[b] := jiepop[s2].gongxu[c];
        jiepop[s2].gongxu[c] := gongxu;
        goto 2;
      end;
      c := c - 1;
    until c = p1 - 1;   //很关键
2:

  end;
  begin
    //测试重复
    for a := 1 to n_guimo do
    begin
      b := a;
      repeat
        b := b + 1;
      until (b = n_guimo + 1) or (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu);
      if (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu) then
      begin
        flag1 := 1;
      end;
    end;
    DABC_decode(s1);
    DABC_evaluate(s1);
    if jiepop[s1].CTp <= CT then
    begin
      CT := jiepop[s1].CTp - 1;
      Memo1.Lines.Add('雇佣find：' + inttostr(jiepop[s1].CTp));
      DABC_CT := jiepop[s1].CTp;
      DABC_SI := JIEPOP[s1].LSI;
    end;
    DABC_decode(s2);
    DABC_evaluate(s2);
    if jiepop[s2].CTp <= CT then
    begin
      CT := jiepop[s2].CTp - 1;
      Memo1.Lines.Add('雇佣find：' + inttostr(jiepop[s2].CTp));
      DABC_CT := jiepop[s1].CTp;
      DABC_SI := JIEPOP[s1].LSI;
    end;
  end;
end;

//OX交叉算子  破坏性太大
procedure TForm1.DABC_OX();
var
  flag1, flag2: array[1..200] of integer;
  a: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1: set of 1..255;
  lab2: integer;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //选交叉位置
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //调整s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //将父代1的不变片段  放入集合 用做父代2的判断
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //夫2的遍历下标
  for a := 1 to (p1 - 1) do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //从父2中选择放入子1前端
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  DABC_decode(s1);
  DABC_evaluate(s1);
  if jiepop[s1].CTp < bestCTp then //更新CT
  begin
//    Memo1.Lines.Add('OX雇佣find：' + inttostr(jiepop[s1].CTp));
    bestind := S1;
    bestCTp:=jiepop[s1].CTp;
    CT:=bestCTp-1;
    DABC_SI := jiepop[s1].LSI;
    DABC_CT := jiepop[s1].CTp;
  end;
end;

procedure TForm1.EDA_OX();
var
  flag1, flag2: array[1..200] of integer;
  a,b: Integer;
  s1, s2: Integer;  //选个体
  p1, p2, mid: Integer;  //选交叉位置
  set1: set of 1..255;
  lab2: integer;
  label 1;
begin
  for b := 1 to popsize do
  begin
    s1:=B;
    s2:=s1;
    while s1=s2 do
    begin
      randomize ;
      s2:=RandomRange(1,popsize) ;
    end;
    p1 := 1;
    p2 := 1;
    while p1 = p2 do             //选交叉位置
    begin
      randomize ;
      p1 := RandomRange(1, n_guimo);
      p2 := RandomRange(1, n_guimo);
    end;
    if p1 > p2 then  //调整s1<s2
    begin
      mid := p1;
      p1 := p2;
      p2 := mid;
    end;
    set1 := [];
    for a := p1 to p2 do  //将父代1的不变片段  放入集合 用做父代2的判断
    begin
      set1 := set1 + [jiepop[s1].gongxu[a].xu];
    end;
    lab2 := 0;  //夫2的遍历下标
    for a := 1 to (p1 - 1) do     //从父2中选择放入子1前端
    begin
      repeat
        lab2 := lab2 + 1;
      until not (jiepop[s2].gongxu[lab2].xu in set1);
      jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
    end;
    for a := p2 + 1 to n_guimo do     //从父2中选择放入子1前端
    begin
      repeat
        lab2 := lab2 + 1;
      until not (jiepop[s2].gongxu[lab2].xu in set1);
      jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
    end;
    EDA_decode2(s1);
    EDA_evaluate2(s1);
    if (jiepop[s1].CTp < bestjie.CTp)OR ((jiepop[s1].CTp = bestjie.CTp)AND(jiepop[s1].LSI < bestjie.LSI) )then //更新CT
    begin
     // Memo1.Lines.Add('OX find：' + inttostr(jiepop[s1].CTp)+IntToStr(s1)+'  SI: '+floatTOSTR(bestjie.LSI));
      if (jiepop[s1].CTp < bestjie.CTp) then
      begin
        CT := bestjie.CTp - 1;
      end;
      bestjie:=jiepop[s1];
      bestkexingjie:=kexingjiepop[s1];
      EDA_SI := bestjie.LSI;
      EDA_CT := bestjie.CTp;
      EDA_update_M;
    end
  end;
end;
//启发式+随机式初始化种群
//默认30+70
procedure  TForm1.savebestdate();
var
  a,b,c:integer;
begin
  ExcelApp.Cells[line_sb, crow_sb].Value :=inttostr(bestjie.CTp);
  ExcelApp.Cells[line_sb, crow_sb+1].Value :=floattostr(bestjie.LSI);
  line_sb:=line_sb+1;

end;
procedure TForm1.EDA_Createpop_Intial();
var
  Wp: array[1..250] of double; //工序的权重数组
  C1, C2: double;
  i: integer;
  t: array[1..250] of Integer; //每个工序的时间

  totalT: integer;
  a, b, c, d: integer;
  number: integer;
  TotalHouxu: integer;
  ind: Integer;
label
  1;
begin
  totalT := 0;  //指标1   时间
  for i := 1 to n_guimo do
    totalT := totalT + jiepop[299].gongxu[i].shijian;

  TotalHouxu := 0;
  for a := 1 to n_guimo do//计算总的后续个数[固定值]
    TotalHouxu := TotalHouxu + jiepop[299].gongxu[a].bnum;

  for d := 1 to popsize do
  begin
    C1 := random(10) / 10;
    C2 := 1 - C1;  //权重之和 1
    jiepop[300] := jiepop[299];
    for i := 1 to N_guimo do
    begin
      jiepop[300].gongxu[i].Wp := C1 * jiepop[300].gongxu[i].shijian / totalT + C2 * jiepop[300].gongxu[i].bnum / TotalHouxu//求解每个工序的权重
    end;
    maopao();
    jiepop[d] := jiepop[300];
    jiepop[300] := jiepop[299];
  end;
 // RandomCreateJie(  );// 随机解 // 70个
  for ind := 1 to popsize do //解码评价
  begin
    EDA_decode(ind);
    EDA_evaluate(ind);
  end;
end;
//启发式+随机式初始化种群
//默认30+70

procedure TForm1.DABC_CreateJIEpop();
var
  Wp: array[1..250] of double; //工序的权重数组
  C1, C2: double;
  i: integer;
  t: array[1..250] of Integer; //每个工序的时间

  totalT: integer;
  a, b, c, d: integer;
  number: integer;
  TotalHouxu: integer;
label
  1;
begin
  totalT := 0;  //指标1   时间
  for i := 1 to n_guimo do
    totalT := totalT + jiepop[200].gongxu[i].shijian;

  for a := 1 to n_guimo do//计算总的后续个数[固定值]
    TotalHouxu := TotalHouxu + jiepop[200].gongxu[a].bnum;

  for d := 1 to Trunc(0.3 * popsize) do        //30个
  begin
    Randomize;
    C1 := random(10) / 10;
    C2 := 1 - C1;  //权重之和 1
    jiepop[200] := jiepop[199];   //102一直保存原版数据
    for i := 1 to N_guimo do
    begin
      jiepop[200].gongxu[i].Wp := C1 * jiepop[200].gongxu[i].shijian / totalT + C2 * jiepop[200].gongxu[i].bnum / TotalHouxu//求解每个工序的权重
    end;
    //对序排序  并保存为什么形式？
    maopao();
    jiepop[d] := jiepop[200];
    jiepop[200] := jiepop[199];
  end; //启发式规则生成初始解
  RandomCreateJie()// 随机解 // 70个
end;
//冒泡排序  ///排初始化序   //降序

procedure TForm1.maopao();
var
  i, j, k: integer;
  temp: structure_gongxu;
begin
  for i := (n_guimo - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                          //降序
      if jiepop[300].gongxu[j].Wp < jiepop[300].gongxu[j + 1].Wp then
      begin
        temp := jiepop[300].gongxu[j];
        jiepop[300].gongxu[j] := jiepop[300].gongxu[j + 1];
        jiepop[300].gongxu[j + 1] := temp;
      end;
    end;
  end;
end;
//两级评价函数
//输入:INDIVIAL  [二级评价有效]

procedure TForm1.DABC_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  FLAG:Integer;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
 //计算平滑指数SI
  for A := 1 to zhannumber do //计算每个站的实际工作时间
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //左边
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //右边
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;
  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;
  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  //DABC二级评价(利用末尾负荷)
  if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then//DABC二级评价
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//权重结果越小越好
    begin                       //但站的节拍存放到左边站里面的，直接覆盖左边
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + jiepop[ind].CTp) / 2) + max(0, BCT - (jiepop[ind].CTp - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + jiepop[ind].CTp) / 2) + max(0, BCT - (jiepop[ind].CTp - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    jiepop[ind].DABC_L2:=compare1;
    if compare2 <= compare1 then  //原来的解更好则，换回去
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //新解更好  备份old
    begin
      jiepop[ind].DABC_L2:=compare1;
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  if (iteration > 0) and (oldjiepop[ind].CTp < jiepop[ind].CTp) then  //换回去
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //新解更好  备份old
  if (iteration > 0) and (oldjiepop[ind].CTp > jiepop[ind].CTp) then
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;
end;
procedure TForm1.DABC_evaluate_ini(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  if MaxT = 0 then
  begin
    MaxT := 0;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  for b := 1 to zhannumber do//权重结果越小越好
  begin                       //但站的节拍存放到左边站里面的，直接覆盖左边
    compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
  end;
  jiepop[ind].DABC_L2:=compare1;
 //计算平滑指数SI
  for A := 1 to zhannumber do //计算每个站的实际工作时间
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //左边
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //右边
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;

  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
end;
//重构站的评价
//得到LSI平滑指数
//并决定使用重构的结果

procedure TForm1.Restructure_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //利用站内实际工作时间作为目标再平衡 //计算平滑指数SI
  Light[A] := 0;
  Right[A] := 0;
  b := 1;   //左边
  Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
  repeat
    if jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian > Light_max then
    begin
      Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
    end;
    Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
    b := b + 1;
  until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
  b := 1;   //右边
  Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
  repeat
    if jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian > Right_max then
    begin
      Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
    end;
    Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
    b := b + 1;
  until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;

  MAX_T := max(Light_max, Right_max);     //只计算一个站的左右边偏差
  LSI := 0;                              //差值变小说明结果变好
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;    //198个体  只有重构站的信息
  //计算SI 结束
end;
//IG评价函数

procedure TForm1.IG_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //本条线的最大CTp时间
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  freet1: Integer;
  freet2: Integer;
  freet3: Integer;
  freet4: Integer;
  freet4_1: Integer;
  w1, w2, w3, w4: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // 计算每对站的完工时间CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //计算最大站完工时间
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //得到一级评价站节拍CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //计算SI
 //计算平滑指数SI
  for A := 1 to zhannumber do //计算每个站的实际工作时间
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //左边
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //右边
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;

  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;

  begin  //以SI为导向  保留解
    if (BEST_LSI > jiepop[ind].LSI) and (jiepop[ind].LSI <= ct) and (ITERATION > 0) then
    begin
      BEST_LSI := LSI;
      BEST_LSI_jiepop := jiepop[ind];
      BEST_LSI_kexingjiepop := kexingjiepop[ind];
    end;
  end;
  //计算SI结束
  if (iteration = 0) or (jiepop[ind].CTp = oldjiepop[ind].CTp) then
  begin
    freet1 := 0;
    freet2 := 0;
    freet3 := 0;
    freet4 := 0;
    w1 := 10;  //参数
    w2 := 5;
    w3 := 1;
    w4 := 1;
    for A := 1 to zhannumber do  //末尾空闲
    begin             //最后一台站的超出可能产生负数  作者没说明  这里取绝对值
      freet1 := (Trunc(freet1 + abs(CT - kexingjiepop[ind].zuoBianzhan[A].zongshijian) + abs(CT - kexingjiepop[ind].youBianzhan[A].zongshijian)));
    end;
    freet1 := Trunc(w1 * freet1 / (2 * zhannumber));

    for A := 1 to zhannumber do   //中间空闲
    begin
      b := 1;
      repeat
        freet2 := freet2 + (jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      freet2 := freet2 + kexingjiepop[ind].zuoBianzhan[A].zongshijian - freet2; //得到左边站内空闲

      b := 1;
      repeat
        freet2 := freet2 + (jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      freet2 := freet2 + kexingjiepop[ind].youBianzhan[A].zongshijian - freet2; //得到左边站内空闲
    end;
    freet2 := Trunc(w2 * freet2 / (2 * zhannumber));

    for A := 1 to zhannumber do  //末尾空闲 方差
    begin
      freet3 := Trunc(freet3 + sqr(CT - kexingjiepop[ind].zuoBianzhan[A].zongshijian) + sqr(CT - kexingjiepop[ind].youBianzhan[A].zongshijian));
    end;
    freet3 := Trunc(w3 * sqrt(freet3 / (2 * zhannumber)));

    for A := 1 to zhannumber do   //中间空闲
    begin
      b := 1;
      freet4_1 := 0;
      repeat
        freet4_1 := freet4_1 + (jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      freet4 := freet4 + sqr(kexingjiepop[ind].zuoBianzhan[A].zongshijian - freet4_1); //得到左边站内空闲

      b := 1;
      freet4_1 := 0;
      repeat
        freet4_1 := freet4_1 + (jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      freet4 := freet4 + sqr(kexingjiepop[ind].youBianzhan[A].zongshijian - freet4_1); //得到左边站内空闲
    end;
    freet4 := Trunc(w4 * sqrt(freet4 / (2 * zhannumber)));

    jiepop[ind].IG_indexCT := freet1 + freet2 + freet3 + freet4; //加权评价指标
    if iteration > 0 then  //iteration、只计算不比较
    begin
      if jiepop[ind].IG_indexCT <= oldjiepop[ind].IG_indexCT then
      begin
        oldjiepop[ind] := jiepop[ind];               //备份
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else if jiepop[ind].IG_indexCT > oldjiepop[ind].IG_indexCT then
      begin  //换回
        jiepop[ind] := oldjiepop[ind];               //换回
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;

    end;
  end
  else if (iteration > 0) and (jiepop[ind].CTp < oldjiepop[ind].CTp) then  //新更好
  begin
    oldjiepop[ind] := jiepop[ind];               //备份
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end
  else if (iteration > 0) and (jiepop[ind].CTp > oldjiepop[ind].CTp) then //新解更差
  begin
    jiepop[ind] := oldjiepop[ind];               //换回
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end;
end;

function TForm1.comp_SI(var ind: Integer): Double;
var
  a: Integer;
  MAXTIME: Integer;
  sumsqr: Integer;
begin
  MAXTIME := kexingjiepop[ind].Station[1].OverTime;
  for a := 1 to zhannumber - 1 do
  begin
    if kexingjiepop[ind].Station[a].OverTime > kexingjiepop[ind].Station[a + 1].OverTime then
    begin
      MAXTIME := kexingjiepop[ind].Station[a + 1].OverTime;
    end;
  end;
  sumsqr := 0;
  for a := 1 to zhannumber do
  begin
    sumsqr := sumsqr + Sqr(MAXTIME - kexingjiepop[ind].Station[a].OverTime);
  end;
  SI := 0;
  SI := Sqrt(sumsqr);
  Result := SI;
end;
//CT迭代减小
//输入：当前迭代次数,当前CT
//输出：新CT的值

procedure TForm1.DABC_ReCT();
begin
  CT := CT - Trunc(max(1, IndexD * (iterationMAX - 2 * iteration) / iterationMax) + 1); //10  与  100
end;

procedure TForm1.DABC_ReCT1();
begin
  CT := BestCT - 1;
end;

//随机解
procedure TForm1.RandomCreateJie();
var
  b: structure_gongxu;
  a, c: integer;
  weizhi1, weizhi2: integer;
begin
  for a := (Trunc(popsize * 0.3) + 1) to popsize do
  begin
    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //随机打乱次数
    begin
      weizhi1 := random(n_guimo) + 1;
      weizhi2 := random(n_guimo) + 1;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    jiepop[a] := jiepop[200];
    jiepop[200] := jiepop[199];
  end;
end;
//侦察蜂所用的集合解

procedure TForm1.DABC20set(var scout_number: Integer);
var
  b: structure_gongxu;
  a, c: integer;
  weizhi1, weizhi2: integer;
begin
  for a := 1 to scout_number do
  begin
    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //随机打乱次数  //
    begin
      weizhi1 := 1;
      weizhi2 := 1;
      while (weizhi1 = weizhi2) do //选取两个不同的点
      begin
        randomize ;
        weizhi1 := RandomRange(1, n_guimo);
        weizhi2 := RandomRange(1, n_guimo);
      end;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    Scoutjiepop[a] := jiepop[200];
  end;
end;
//EDA甘特图



end.

