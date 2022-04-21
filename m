Content-Type: multipart/mixed; boundary="===============1203842095931599428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm8001_sas.c:1112:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 21 Apr 2022 14:43:09 +0800
Message-ID: <202204210640.CQAJz3o5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1203842095931599428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Garry <john.garry@huawei.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 2cbbf489778eb9dde51392ec5f74ae2868e4b857 scsi: pm8001: Use libsas i=
nternal abort support
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220419 (https://download.01.org/0day-ci/arc=
hive/20220421/202204210640.CQAJz3o5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a=
356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2cbbf489778eb9dde51392ec5f74ae2868e4b857
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2cbbf489778eb9dde51392ec5f74ae2868e4b857
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:982:2: note: Taking false branch
           if (!btrfs_test_opt(fs_info, REF_VERIFY))
           ^
   fs/btrfs/ref-verify.c:986:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/ref-verify.c:986:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/ref-verify.c:996:2: note: Loop condition is true.  Entering loo=
p body
           while (1) {
           ^
   fs/btrfs/ref-verify.c:1005:7: note: Assuming 'ret' is not equal to 0
                   if (ret)
                       ^~~
   fs/btrfs/ref-verify.c:1005:3: note: Taking true branch
                   if (ret)
                   ^
   fs/btrfs/ref-verify.c:1006:4: note:  Execution continues on line 1015
                           break;
                           ^
   fs/btrfs/ref-verify.c:1015:6: note: 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/btrfs/ref-verify.c:1015:2: note: Taking true branch
           if (ret) {
           ^
   fs/btrfs/ref-verify.c:1017:3: note: Calling 'btrfs_free_ref_cache'
                   btrfs_free_ref_cache(fs_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:895:6: note: Assuming the condition is false
           if (!btrfs_test_opt(fs_info, REF_VERIFY))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:895:2: note: Taking false branch
           if (!btrfs_test_opt(fs_info, REF_VERIFY))
           ^
   fs/btrfs/ref-verify.c:899:2: note: Loop condition is true.  Entering loo=
p body
           while ((n =3D rb_first(&fs_info->block_tree))) {
           ^
   fs/btrfs/ref-verify.c:902:3: note: Calling 'free_block_entry'
                   free_block_entry(be);
                   ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:239:2: note: Loop condition is false. Execution co=
ntinues on line 245
           while ((n =3D rb_first(&be->roots))) {
           ^
   fs/btrfs/ref-verify.c:245:2: note: Loop condition is false. Execution co=
ntinues on line 251
           while((n =3D rb_first(&be->refs))) {
           ^
   fs/btrfs/ref-verify.c:251:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&be->actions)) {
           ^
   fs/btrfs/ref-verify.c:255:3: note: Memory is released
                   kfree(ra);
                   ^~~~~~~~~
   fs/btrfs/ref-verify.c:251:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&be->actions)) {
           ^
   fs/btrfs/ref-verify.c:254:3: note: Calling 'list_del'
                   list_del(&ra->list);
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/scsi/pm8001/pm8001_init.c:413:3: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:413:3: note: Value stored to 'rc' is n=
ever read
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/scsi/pm8001/pm8001_sas.c:422:24: warning: Value stored to 'pm800=
1_dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:422:24: note: Value stored to 'pm8001_d=
ev' during its initialization is never read
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:659:4: warning: Value stored to 'res' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:659:4: note: Value stored to 'res' is n=
ever read
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:924:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:924:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/pm8001/pm8001_sas.c:1112:4: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D sas_execute_internal_abort_single(dev, t=
ag, 0, NULL);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:1112:4: note: Value stored to 'ret' is =
never read
                           ret =3D sas_execute_internal_abort_single(dev, t=
ag, 0, NULL);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:379:27: warning: The r=
esult of the left shift is undefined because the left operand is negative [=
clang-analyzer-core.UndefinedBinaryOperatorResult]
           timing[2] =3D (T(CWL) - 1) << 24 |
                                    ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:515:6: note: Assuming =
field 'state' is not equal to NVA3_TRAIN_ONCE
           if (ram->ltrain.state =3D=3D NVA3_TRAIN_ONCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:515:2: note: Taking fa=
lse branch
           if (ram->ltrain.state =3D=3D NVA3_TRAIN_ONCE)
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Assuming =
'data' is not equal to 0
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Left side=
 of '||' is false
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:15: note: Assuming=
 'ver' is equal to 16
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
                        ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:6: note: Left side=
 of '||' is false
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:30: note: Assuming=
 'hdr' is >=3D 5
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
                                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:521:2: note: Taking fa=
lse branch
           if (!data || ver !=3D 0x10 || hdr < 0x05) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:528:6: note: Assuming =
'strap' is < 'cnt'
           if (strap >=3D cnt) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:528:2: note: Taking fa=
lse branch
           if (strap >=3D cnt) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Assuming =
'data' is not equal to 0
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Left side=
 of '||' is false
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:15: note: Assuming=
 'ver' is equal to 16
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
                        ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:6: note: Left side=
 of '||' is false
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:30: note: Assuming=
 'hdr' is >=3D 9
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
                                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:535:2: note: Taking fa=
lse branch
           if (!data || ver !=3D 0x10 || hdr < 0x09) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:541:6: note: Assuming =
field 'ramcfg_timing' is equal to 255
           if (next->bios.ramcfg_timing !=3D 0xff) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:541:2: note: Taking fa=
lse branch
           if (next->bios.ramcfg_timing !=3D 0xff) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:552:6: note: Assuming =
'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:552:2: note: Taking fa=
lse branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:557:2: note: Calling '=
gt215_ram_timing_calc'
           gt215_ram_timing_calc(ram, timing);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:362:11: note: Assuming=
 field 'timing_10_CWL' is 0
           switch ((!T(CWL)) * ram->base.type) {
                    ^~~~~~~

vim +/ret +1112 drivers/scsi/pm8001/pm8001_sas.c

dbf9bfe615717d jack wang    2009-10-14   978  =

32877947b7a806 Weitao Hou   2019-05-20   979  /*  mandatory SAM-3, still ne=
ed free task/ccb info, abort the specified task */
dbf9bfe615717d jack wang    2009-10-14   980  int pm8001_abort_task(struct =
sas_task *task)
dbf9bfe615717d jack wang    2009-10-14   981  {
dbf9bfe615717d jack wang    2009-10-14   982  	unsigned long flags;
1db49906d8fa87 Viswas G     2017-10-18   983  	u32 tag;
dbf9bfe615717d jack wang    2009-10-14   984  	struct domain_device *dev ;
1db49906d8fa87 Viswas G     2017-10-18   985  	struct pm8001_hba_info *pm80=
01_ha;
dbf9bfe615717d jack wang    2009-10-14   986  	struct pm8001_device *pm8001=
_dev;
869ddbdcae3b4f Viswas G     2017-10-18   987  	int rc =3D TMF_RESP_FUNC_FAI=
LED, ret;
ee05cb71f9f7eb Ajish Koshy  2021-12-28   988  	u32 phy_id, port_id;
869ddbdcae3b4f Viswas G     2017-10-18   989  	struct sas_task_slow slow_ta=
sk;
a961ea0afd632c akshatzen    2021-01-09   990  =

dbf9bfe615717d jack wang    2009-10-14   991  	if (unlikely(!task || !task-=
>lldd_task || !task->dev))
1db49906d8fa87 Viswas G     2017-10-18   992  		return TMF_RESP_FUNC_FAILED;
a961ea0afd632c akshatzen    2021-01-09   993  =

1db49906d8fa87 Viswas G     2017-10-18   994  	dev =3D task->dev;
1db49906d8fa87 Viswas G     2017-10-18   995  	pm8001_dev =3D dev->lldd_dev;
1db49906d8fa87 Viswas G     2017-10-18   996  	pm8001_ha =3D pm8001_find_ha=
_by_dev(dev);
869ddbdcae3b4f Viswas G     2017-10-18   997  	phy_id =3D pm8001_dev->attac=
hed_phy;
a961ea0afd632c akshatzen    2021-01-09   998  =

a961ea0afd632c akshatzen    2021-01-09   999  	if (PM8001_CHIP_DISP->fatal_=
errors(pm8001_ha)) {
a961ea0afd632c akshatzen    2021-01-09  1000  		// If the controller is see=
ing fatal errors
a961ea0afd632c akshatzen    2021-01-09  1001  		// abort task will not get =
a response from the controller
a961ea0afd632c akshatzen    2021-01-09  1002  		return TMF_RESP_FUNC_FAILED;
a961ea0afd632c akshatzen    2021-01-09  1003  	}
a961ea0afd632c akshatzen    2021-01-09  1004  =

51c1c5f6ed64c2 peter chang  2019-11-14  1005  	ret =3D pm8001_find_tag(task=
, &tag);
51c1c5f6ed64c2 peter chang  2019-11-14  1006  	if (ret =3D=3D 0) {
2ce6e200a04c24 Joe Perches  2020-11-23  1007  		pm8001_info(pm8001_ha, "no =
tag for task:%p\n", task);
1db49906d8fa87 Viswas G     2017-10-18  1008  		return TMF_RESP_FUNC_FAILED;
1db49906d8fa87 Viswas G     2017-10-18  1009  	}
dbf9bfe615717d jack wang    2009-10-14  1010  	spin_lock_irqsave(&task->tas=
k_state_lock, flags);
dbf9bfe615717d jack wang    2009-10-14  1011  	if (task->task_state_flags &=
 SAS_TASK_STATE_DONE) {
dbf9bfe615717d jack wang    2009-10-14  1012  		spin_unlock_irqrestore(&tas=
k->task_state_lock, flags);
1db49906d8fa87 Viswas G     2017-10-18  1013  		return TMF_RESP_FUNC_COMPLE=
TE;
dbf9bfe615717d jack wang    2009-10-14  1014  	}
869ddbdcae3b4f Viswas G     2017-10-18  1015  	task->task_state_flags |=3D =
SAS_TASK_STATE_ABORTED;
869ddbdcae3b4f Viswas G     2017-10-18  1016  	if (task->slow_task =3D=3D N=
ULL) {
869ddbdcae3b4f Viswas G     2017-10-18  1017  		init_completion(&slow_task.=
completion);
869ddbdcae3b4f Viswas G     2017-10-18  1018  		task->slow_task =3D &slow_t=
ask;
dbf9bfe615717d jack wang    2009-10-14  1019  	}
dbf9bfe615717d jack wang    2009-10-14  1020  	spin_unlock_irqrestore(&task=
->task_state_lock, flags);
dbf9bfe615717d jack wang    2009-10-14  1021  	if (task->task_proto & SAS_P=
ROTOCOL_SSP) {
4fea759edfa795 John Garry   2022-02-17  1022  		rc =3D sas_abort_task(task,=
 tag);
2cbbf489778eb9 John Garry   2022-03-11  1023  		sas_execute_internal_abort_=
single(dev, tag, 0, NULL);
dbf9bfe615717d jack wang    2009-10-14  1024  	} else if (task->task_proto =
& SAS_PROTOCOL_SATA ||
dbf9bfe615717d jack wang    2009-10-14  1025  		task->task_proto & SAS_PROT=
OCOL_STP) {
869ddbdcae3b4f Viswas G     2017-10-18  1026  		if (pm8001_ha->chip_id =3D=
=3D chip_8006) {
869ddbdcae3b4f Viswas G     2017-10-18  1027  			DECLARE_COMPLETION_ONSTACK=
(completion_reset);
869ddbdcae3b4f Viswas G     2017-10-18  1028  			DECLARE_COMPLETION_ONSTACK=
(completion);
869ddbdcae3b4f Viswas G     2017-10-18  1029  			struct pm8001_phy *phy =3D=
 pm8001_ha->phy + phy_id;
ee05cb71f9f7eb Ajish Koshy  2021-12-28  1030  			port_id =3D phy->port->por=
t_id;
869ddbdcae3b4f Viswas G     2017-10-18  1031  =

869ddbdcae3b4f Viswas G     2017-10-18  1032  			/* 1. Set Device state as =
Recovery */
869ddbdcae3b4f Viswas G     2017-10-18  1033  			pm8001_dev->setds_completi=
on =3D &completion;
869ddbdcae3b4f Viswas G     2017-10-18  1034  			PM8001_CHIP_DISP->set_dev_=
state_req(pm8001_ha,
9ec3d4c1056533 Igor Pylypiv 2021-03-04  1035  				pm8001_dev, DS_IN_RECOVER=
Y);
869ddbdcae3b4f Viswas G     2017-10-18  1036  			wait_for_completion(&compl=
etion);
869ddbdcae3b4f Viswas G     2017-10-18  1037  =

869ddbdcae3b4f Viswas G     2017-10-18  1038  			/* 2. Send Phy Control Har=
d Reset */
869ddbdcae3b4f Viswas G     2017-10-18  1039  			reinit_completion(&complet=
ion);
51c1c5f6ed64c2 peter chang  2019-11-14  1040  			phy->port_reset_status =3D=
 PORT_RESET_TMO;
869ddbdcae3b4f Viswas G     2017-10-18  1041  			phy->reset_success =3D fal=
se;
869ddbdcae3b4f Viswas G     2017-10-18  1042  			phy->enable_completion =3D=
 &completion;
869ddbdcae3b4f Viswas G     2017-10-18  1043  			phy->reset_completion =3D =
&completion_reset;
869ddbdcae3b4f Viswas G     2017-10-18  1044  			ret =3D PM8001_CHIP_DISP->=
phy_ctl_req(pm8001_ha, phy_id,
869ddbdcae3b4f Viswas G     2017-10-18  1045  				PHY_HARD_RESET);
51c1c5f6ed64c2 peter chang  2019-11-14  1046  			if (ret) {
51c1c5f6ed64c2 peter chang  2019-11-14  1047  				phy->enable_completion =
=3D NULL;
51c1c5f6ed64c2 peter chang  2019-11-14  1048  				phy->reset_completion =3D=
 NULL;
869ddbdcae3b4f Viswas G     2017-10-18  1049  				goto out;
51c1c5f6ed64c2 peter chang  2019-11-14  1050  			}
51c1c5f6ed64c2 peter chang  2019-11-14  1051  =

51c1c5f6ed64c2 peter chang  2019-11-14  1052  			/* In the case of the rese=
t timeout/fail we still
51c1c5f6ed64c2 peter chang  2019-11-14  1053  			 * abort the command at th=
e firmware. The assumption
51c1c5f6ed64c2 peter chang  2019-11-14  1054  			 * here is that the drive =
is off doing something so
51c1c5f6ed64c2 peter chang  2019-11-14  1055  			 * that it's not processin=
g requests, and we want to
51c1c5f6ed64c2 peter chang  2019-11-14  1056  			 * avoid getting a complet=
ion for this and either
51c1c5f6ed64c2 peter chang  2019-11-14  1057  			 * leaking the task in lib=
sas or losing the race and
51c1c5f6ed64c2 peter chang  2019-11-14  1058  			 * getting a double free.
51c1c5f6ed64c2 peter chang  2019-11-14  1059  			 */
1b5d2793283dcb Joe Perches  2020-11-20  1060  			pm8001_dbg(pm8001_ha, MSG,
1b5d2793283dcb Joe Perches  2020-11-20  1061  				   "Waiting for local phy=
 ctl\n");
51c1c5f6ed64c2 peter chang  2019-11-14  1062  			ret =3D wait_for_completio=
n_timeout(&completion,
51c1c5f6ed64c2 peter chang  2019-11-14  1063  					PM8001_TASK_TIMEOUT * HZ=
);
51c1c5f6ed64c2 peter chang  2019-11-14  1064  			if (!ret || !phy->reset_su=
ccess) {
51c1c5f6ed64c2 peter chang  2019-11-14  1065  				phy->enable_completion =
=3D NULL;
51c1c5f6ed64c2 peter chang  2019-11-14  1066  				phy->reset_completion =3D=
 NULL;
51c1c5f6ed64c2 peter chang  2019-11-14  1067  			} else {
51c1c5f6ed64c2 peter chang  2019-11-14  1068  				/* 3. Wait for Port Reset=
 complete or
51c1c5f6ed64c2 peter chang  2019-11-14  1069  				 * Port reset TMO
51c1c5f6ed64c2 peter chang  2019-11-14  1070  				 */
1b5d2793283dcb Joe Perches  2020-11-20  1071  				pm8001_dbg(pm8001_ha, MSG,
1b5d2793283dcb Joe Perches  2020-11-20  1072  					   "Waiting for Port res=
et\n");
51c1c5f6ed64c2 peter chang  2019-11-14  1073  				ret =3D wait_for_completi=
on_timeout(
51c1c5f6ed64c2 peter chang  2019-11-14  1074  					&completion_reset,
51c1c5f6ed64c2 peter chang  2019-11-14  1075  					PM8001_TASK_TIMEOUT * HZ=
);
51c1c5f6ed64c2 peter chang  2019-11-14  1076  				if (!ret)
51c1c5f6ed64c2 peter chang  2019-11-14  1077  					phy->reset_completion =
=3D NULL;
51c1c5f6ed64c2 peter chang  2019-11-14  1078  				WARN_ON(phy->port_reset_s=
tatus =3D=3D
51c1c5f6ed64c2 peter chang  2019-11-14  1079  						PORT_RESET_TMO);
51c1c5f6ed64c2 peter chang  2019-11-14  1080  				if (phy->port_reset_statu=
s =3D=3D PORT_RESET_TMO) {
196ba6629cf95e Deepak Ukey  2019-07-09  1081  					pm8001_dev_gone_notify(d=
ev);
ee05cb71f9f7eb Ajish Koshy  2021-12-28  1082  					PM8001_CHIP_DISP->hw_eve=
nt_ack_req(
ee05cb71f9f7eb Ajish Koshy  2021-12-28  1083  						pm8001_ha, 0,
ee05cb71f9f7eb Ajish Koshy  2021-12-28  1084  						0x07, /*HW_EVENT_PHY_DO=
WN ack*/
ee05cb71f9f7eb Ajish Koshy  2021-12-28  1085  						port_id, phy_id, 0, 0);
869ddbdcae3b4f Viswas G     2017-10-18  1086  					goto out;
196ba6629cf95e Deepak Ukey  2019-07-09  1087  				}
51c1c5f6ed64c2 peter chang  2019-11-14  1088  			}
869ddbdcae3b4f Viswas G     2017-10-18  1089  =

869ddbdcae3b4f Viswas G     2017-10-18  1090  			/*
869ddbdcae3b4f Viswas G     2017-10-18  1091  			 * 4. SATA Abort ALL
869ddbdcae3b4f Viswas G     2017-10-18  1092  			 * we wait for the task to=
 be aborted so that the task
869ddbdcae3b4f Viswas G     2017-10-18  1093  			 * is removed from the ccb=
. on success the caller is
869ddbdcae3b4f Viswas G     2017-10-18  1094  			 * going to free the task.
869ddbdcae3b4f Viswas G     2017-10-18  1095  			 */
2cbbf489778eb9 John Garry   2022-03-11  1096  			ret =3D sas_execute_intern=
al_abort_dev(dev, 0, NULL);
869ddbdcae3b4f Viswas G     2017-10-18  1097  			if (ret)
869ddbdcae3b4f Viswas G     2017-10-18  1098  				goto out;
869ddbdcae3b4f Viswas G     2017-10-18  1099  			ret =3D wait_for_completio=
n_timeout(
869ddbdcae3b4f Viswas G     2017-10-18  1100  				&task->slow_task->complet=
ion,
869ddbdcae3b4f Viswas G     2017-10-18  1101  				PM8001_TASK_TIMEOUT * HZ);
869ddbdcae3b4f Viswas G     2017-10-18  1102  			if (!ret)
869ddbdcae3b4f Viswas G     2017-10-18  1103  				goto out;
869ddbdcae3b4f Viswas G     2017-10-18  1104  =

869ddbdcae3b4f Viswas G     2017-10-18  1105  			/* 5. Set Device State as =
Operational */
869ddbdcae3b4f Viswas G     2017-10-18  1106  			reinit_completion(&complet=
ion);
869ddbdcae3b4f Viswas G     2017-10-18  1107  			pm8001_dev->setds_completi=
on =3D &completion;
869ddbdcae3b4f Viswas G     2017-10-18  1108  			PM8001_CHIP_DISP->set_dev_=
state_req(pm8001_ha,
9ec3d4c1056533 Igor Pylypiv 2021-03-04  1109  				pm8001_dev, DS_OPERATIONA=
L);
869ddbdcae3b4f Viswas G     2017-10-18  1110  			wait_for_completion(&compl=
etion);
869ddbdcae3b4f Viswas G     2017-10-18  1111  		} else {
2cbbf489778eb9 John Garry   2022-03-11 @1112  			ret =3D sas_execute_intern=
al_abort_single(dev, tag, 0, NULL);
dbf9bfe615717d jack wang    2009-10-14  1113  		}
869ddbdcae3b4f Viswas G     2017-10-18  1114  		rc =3D TMF_RESP_FUNC_COMPLE=
TE;
dbf9bfe615717d jack wang    2009-10-14  1115  	} else if (task->task_proto =
& SAS_PROTOCOL_SMP) {
dbf9bfe615717d jack wang    2009-10-14  1116  		/* SMP */
2cbbf489778eb9 John Garry   2022-03-11  1117  		rc =3D sas_execute_internal=
_abort_single(dev, tag, 0, NULL);
dbf9bfe615717d jack wang    2009-10-14  1118  =

dbf9bfe615717d jack wang    2009-10-14  1119  	}
dbf9bfe615717d jack wang    2009-10-14  1120  out:
869ddbdcae3b4f Viswas G     2017-10-18  1121  	spin_lock_irqsave(&task->tas=
k_state_lock, flags);
869ddbdcae3b4f Viswas G     2017-10-18  1122  	if (task->slow_task =3D=3D &=
slow_task)
869ddbdcae3b4f Viswas G     2017-10-18  1123  		task->slow_task =3D NULL;
869ddbdcae3b4f Viswas G     2017-10-18  1124  	spin_unlock_irqrestore(&task=
->task_state_lock, flags);
dbf9bfe615717d jack wang    2009-10-14  1125  	if (rc !=3D TMF_RESP_FUNC_CO=
MPLETE)
2ce6e200a04c24 Joe Perches  2020-11-23  1126  		pm8001_info(pm8001_ha, "rc=
=3D %d\n", rc);
dbf9bfe615717d jack wang    2009-10-14  1127  	return rc;
dbf9bfe615717d jack wang    2009-10-14  1128  }
dbf9bfe615717d jack wang    2009-10-14  1129  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1203842095931599428==--

