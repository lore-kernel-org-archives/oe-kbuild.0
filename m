Content-Type: multipart/mixed; boundary="===============4422536266408311732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm8001_sas.c:381:24: warning: Value stored to 'pm8001_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 11 Sep 2022 04:38:16 +0800
Message-ID: <202209110440.QYgtCHlM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4422536266408311732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
csi/pm8001/pm8001_sas.c:381:24: warning: Value stored to 'pm8001_dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Garry <john.garry@huawei.com>
CC: Jack Wang <jinpu.wang@ionos.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: e29c47fe8946cc732b0e0d393b65b13c84bb69d0 scsi: pm8001: Simplify pm8=
001_task_exec()
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220911/202209110440.QYgtCHlM-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De29c47fe8946cc732b0e0d393b65b13c84bb69d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e29c47fe8946cc732b0e0d393b65b13c84bb69d0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/power/supply/bq25980_charger.c:820:27: warning: The right operan=
d of '!=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperator=
Result]
           return (old_state.dischg !=3D new_state->dischg ||
                                    ^
   drivers/power/supply/bq25980_charger.c:837:8: note: Calling 'bq25980_get=
_state'
           ret =3D bq25980_get_state(bq, &state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:571:6: note: Assuming 'ret' is no=
t equal to 0
           if (ret)
               ^~~
   drivers/power/supply/bq25980_charger.c:571:2: note: Taking true branch
           if (ret)
           ^
   drivers/power/supply/bq25980_charger.c:572:3: note: Returning without wr=
iting to 'state->dischg'
                   return ret;
                   ^
   drivers/power/supply/bq25980_charger.c:837:8: note: Returning from 'bq25=
980_get_state'
           ret =3D bq25980_get_state(bq, &state);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:838:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/power/supply/bq25980_charger.c:838:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/power/supply/bq25980_charger.c:841:7: note: Calling 'bq25980_sta=
te_changed'
           if (!bq25980_state_changed(bq, &state))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25980_charger.c:820:27: note: The right operand o=
f '!=3D' is a garbage value
           return (old_state.dischg !=3D new_state->dischg ||
                                    ^  ~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/iio/potentiometer/ad5272.c:49:8: warning: Excessive padding in '=
struct ad5272_data' (106 padding bytes, where 42 is optimal). Optimal field=
s order: buf, client, cfg, lock, consider reordering the fields or adding e=
xplicit padding members [clang-analyzer-optin.performance.Padding]
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/potentiometer/ad5272.c:49:8: note: Excessive padding in 'str=
uct ad5272_data' (106 padding bytes, where 42 is optimal). Optimal fields o=
rder: buf, client, cfg, lock, consider reordering the fields or adding expl=
icit padding members
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/iio/potentiometer/mcp41010.c:58:8: warning: Excessive padding in=
 'struct mcp41010_data' (98 padding bytes, where 34 is optimal). Optimal fi=
elds order: buf, spi, cfg, value, lock, consider reordering the fields or a=
dding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/potentiometer/mcp41010.c:58:8: note: Excessive padding in 's=
truct mcp41010_data' (98 padding bytes, where 34 is optimal). Optimal field=
s order: buf, spi, cfg, value, lock, consider reordering the fields or addi=
ng explicit padding members
   struct mcp41010_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
>> drivers/scsi/pm8001/pm8001_sas.c:381:24: warning: Value stored to 'pm800=
1_dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:381:24: note: Value stored to 'pm8001_d=
ev' during its initialization is never read
           struct pm8001_device *pm8001_dev =3D dev->lldd_dev;
                                 ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:639:4: warning: Value stored to 'res' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:639:4: note: Value stored to 'res' is n=
ever read
                           res =3D -1;
                           ^     ~~
   drivers/scsi/pm8001/pm8001_sas.c:943:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:943:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:959:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:959:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:987:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:987:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D pm8001_exec_internal_task_abort(pm8001_ha, pm8001=
_dev,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/pm8001/pm8001_sas.c:989:3: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:989:3: note: Value stored to 'rc' is ne=
ver read
                   rc =3D sas_phy_reset(phy, 1);
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:1179:4: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D pm8001_exec_internal_task_abort(pm8001_ha,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_sas.c:1179:4: note: Value stored to 'rc' is n=
ever read
                           rc =3D pm8001_exec_internal_task_abort(pm8001_ha,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:727:4: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->gyr=
o_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:727:4: note: Value stored to =
'ret' is never read
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->gyr=
o_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:733:4: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->acc=
l_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:733:4: note: Value stored to =
'ret' is never read
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->acc=
l_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/pm8001_dev +381 drivers/scsi/pm8001/pm8001_sas.c

1cc943ae5003e4 jack wang       2009-12-07  366  =

a0cf5ce40d125a Lee Jones       2020-07-21  367  #define DEV_IS_GONE(pm8001_=
dev)	\
a0cf5ce40d125a Lee Jones       2020-07-21  368  	((!pm8001_dev || (pm8001_d=
ev->dev_type =3D=3D SAS_PHY_UNUSED)))
96e54376a8b270 John Garry      2022-02-17  369  =

dbf9bfe615717d jack wang       2009-10-14  370  /**
96e54376a8b270 John Garry      2022-02-17  371    * pm8001_queue_command - =
register for upper layer used, all IO commands sent
96e54376a8b270 John Garry      2022-02-17  372    * to HBA are from this in=
terface.
dbf9bfe615717d jack wang       2009-10-14  373    * @task: the task to be e=
xecute.
96e54376a8b270 John Garry      2022-02-17  374    * @gfp_flags: gfp_flags
dbf9bfe615717d jack wang       2009-10-14  375    */
96e54376a8b270 John Garry      2022-02-17  376  int pm8001_queue_command(st=
ruct sas_task *task, gfp_t gfp_flags)
dbf9bfe615717d jack wang       2009-10-14  377  {
e29c47fe8946cc Damien Le Moal  2022-02-20  378  	struct task_status_struct =
*ts =3D &task->task_status;
e29c47fe8946cc Damien Le Moal  2022-02-20  379  	enum sas_protocol task_pro=
to =3D task->task_proto;
dbf9bfe615717d jack wang       2009-10-14  380  	struct domain_device *dev =
=3D task->dev;
e29c47fe8946cc Damien Le Moal  2022-02-20 @381  	struct pm8001_device *pm80=
01_dev =3D dev->lldd_dev;
dbf9bfe615717d jack wang       2009-10-14  382  	struct pm8001_hba_info *pm=
8001_ha;
1cc943ae5003e4 jack wang       2009-12-07  383  	struct pm8001_port *port =
=3D NULL;
dbf9bfe615717d jack wang       2009-10-14  384  	struct pm8001_ccb_info *cc=
b;
96e54376a8b270 John Garry      2022-02-17  385  	struct sas_tmf_task *tmf =
=3D task->tmf;
96e54376a8b270 John Garry      2022-02-17  386  	int is_tmf =3D !!task->tmf;
e29c47fe8946cc Damien Le Moal  2022-02-20  387  	unsigned long flags;
e29c47fe8946cc Damien Le Moal  2022-02-20  388  	u32 n_elem =3D 0;
e29c47fe8946cc Damien Le Moal  2022-02-20  389  	int rc =3D 0;
dbf9bfe615717d jack wang       2009-10-14  390  =

dbf9bfe615717d jack wang       2009-10-14  391  	if (!dev->port) {
e29c47fe8946cc Damien Le Moal  2022-02-20  392  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
e29c47fe8946cc Damien Le Moal  2022-02-20  393  		ts->stat =3D SAS_PHY_DOWN;
aa9f8328fc5146 James Bottomley 2013-05-07  394  		if (dev->dev_type !=3D SA=
S_SATA_DEV)
e29c47fe8946cc Damien Le Moal  2022-02-20  395  			task->task_done(task);
dbf9bfe615717d jack wang       2009-10-14  396  		return 0;
dbf9bfe615717d jack wang       2009-10-14  397  	}
72349b62a571ef Deepak Ukey     2018-09-11  398  =

e29c47fe8946cc Damien Le Moal  2022-02-20  399  	pm8001_ha =3D pm8001_find_=
ha_by_dev(dev);
e29c47fe8946cc Damien Le Moal  2022-02-20  400  	if (pm8001_ha->controller_=
fatal_error) {
72349b62a571ef Deepak Ukey     2018-09-11  401  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
e29c47fe8946cc Damien Le Moal  2022-02-20  402  		task->task_done(task);
72349b62a571ef Deepak Ukey     2018-09-11  403  		return 0;
72349b62a571ef Deepak Ukey     2018-09-11  404  	}
e29c47fe8946cc Damien Le Moal  2022-02-20  405  =

1b5d2793283dcb Joe Perches     2020-11-20  406  	pm8001_dbg(pm8001_ha, IO, =
"pm8001_task_exec device\n");
e29c47fe8946cc Damien Le Moal  2022-02-20  407  =

dbf9bfe615717d jack wang       2009-10-14  408  	spin_lock_irqsave(&pm8001_=
ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  409  =

dbf9bfe615717d jack wang       2009-10-14  410  	pm8001_dev =3D dev->lldd_d=
ev;
1cc943ae5003e4 jack wang       2009-12-07  411  	port =3D &pm8001_ha->port[=
sas_find_local_port_id(dev)];
e29c47fe8946cc Damien Le Moal  2022-02-20  412  =

b90b378ad5767c Mark Salyzyn    2011-09-22  413  	if (DEV_IS_GONE(pm8001_dev=
) || !port->port_attached) {
1cc943ae5003e4 jack wang       2009-12-07  414  		ts->resp =3D SAS_TASK_UND=
ELIVERED;
1cc943ae5003e4 jack wang       2009-12-07  415  		ts->stat =3D SAS_PHY_DOWN;
e29c47fe8946cc Damien Le Moal  2022-02-20  416  		if (sas_protocol_ata(task=
_proto)) {
1cc943ae5003e4 jack wang       2009-12-07  417  			spin_unlock_irqrestore(&=
pm8001_ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  418  			task->task_done(task);
1cc943ae5003e4 jack wang       2009-12-07  419  			spin_lock_irqsave(&pm800=
1_ha->lock, flags);
1cc943ae5003e4 jack wang       2009-12-07  420  		} else {
e29c47fe8946cc Damien Le Moal  2022-02-20  421  			task->task_done(task);
1cc943ae5003e4 jack wang       2009-12-07  422  		}
e29c47fe8946cc Damien Le Moal  2022-02-20  423  		rc =3D -ENODEV;
e29c47fe8946cc Damien Le Moal  2022-02-20  424  		goto err_out;
1cc943ae5003e4 jack wang       2009-12-07  425  	}
99df0edb5a9849 Damien Le Moal  2022-02-20  426  =

e29c47fe8946cc Damien Le Moal  2022-02-20  427  	ccb =3D pm8001_ccb_alloc(p=
m8001_ha, pm8001_dev, task);
99df0edb5a9849 Damien Le Moal  2022-02-20  428  	if (!ccb) {
99df0edb5a9849 Damien Le Moal  2022-02-20  429  		rc =3D -SAS_QUEUE_FULL;
dbf9bfe615717d jack wang       2009-10-14  430  		goto err_out;
99df0edb5a9849 Damien Le Moal  2022-02-20  431  	}
dbf9bfe615717d jack wang       2009-10-14  432  =

a88d9db94c4c9f Vikram Auradkar 2019-11-14  433  	if (!sas_protocol_ata(task=
_proto)) {
e29c47fe8946cc Damien Le Moal  2022-02-20  434  		if (task->num_scatter) {
e29c47fe8946cc Damien Le Moal  2022-02-20  435  			n_elem =3D dma_map_sg(pm=
8001_ha->dev, task->scatter,
e29c47fe8946cc Damien Le Moal  2022-02-20  436  					    task->num_scatter,=
 task->data_dir);
dbf9bfe615717d jack wang       2009-10-14  437  			if (!n_elem) {
dbf9bfe615717d jack wang       2009-10-14  438  				rc =3D -ENOMEM;
99df0edb5a9849 Damien Le Moal  2022-02-20  439  				goto err_out_ccb;
dbf9bfe615717d jack wang       2009-10-14  440  			}
dbf9bfe615717d jack wang       2009-10-14  441  		}
dbf9bfe615717d jack wang       2009-10-14  442  	} else {
e29c47fe8946cc Damien Le Moal  2022-02-20  443  		n_elem =3D task->num_scat=
ter;
dbf9bfe615717d jack wang       2009-10-14  444  	}
dbf9bfe615717d jack wang       2009-10-14  445  =

e29c47fe8946cc Damien Le Moal  2022-02-20  446  	task->lldd_task =3D ccb;
dbf9bfe615717d jack wang       2009-10-14  447  	ccb->n_elem =3D n_elem;
99df0edb5a9849 Damien Le Moal  2022-02-20  448  =

e29c47fe8946cc Damien Le Moal  2022-02-20  449  	atomic_inc(&pm8001_dev->ru=
nning_req);
e29c47fe8946cc Damien Le Moal  2022-02-20  450  =

a88d9db94c4c9f Vikram Auradkar 2019-11-14  451  	switch (task_proto) {
dbf9bfe615717d jack wang       2009-10-14  452  	case SAS_PROTOCOL_SMP:
dbf9bfe615717d jack wang       2009-10-14  453  		rc =3D pm8001_task_prep_s=
mp(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  454  		break;
dbf9bfe615717d jack wang       2009-10-14  455  	case SAS_PROTOCOL_SSP:
dbf9bfe615717d jack wang       2009-10-14  456  		if (is_tmf)
e29c47fe8946cc Damien Le Moal  2022-02-20  457  			rc =3D pm8001_task_prep_=
ssp_tm(pm8001_ha, ccb, tmf);
dbf9bfe615717d jack wang       2009-10-14  458  		else
dbf9bfe615717d jack wang       2009-10-14  459  			rc =3D pm8001_task_prep_=
ssp(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  460  		break;
dbf9bfe615717d jack wang       2009-10-14  461  	case SAS_PROTOCOL_SATA:
dbf9bfe615717d jack wang       2009-10-14  462  	case SAS_PROTOCOL_STP:
dbf9bfe615717d jack wang       2009-10-14  463  		rc =3D pm8001_task_prep_a=
ta(pm8001_ha, ccb);
dbf9bfe615717d jack wang       2009-10-14  464  		break;
dbf9bfe615717d jack wang       2009-10-14  465  	default:
dbf9bfe615717d jack wang       2009-10-14  466  		dev_printk(KERN_ERR, pm80=
01_ha->dev,
a88d9db94c4c9f Vikram Auradkar 2019-11-14  467  			   "unknown sas_task pro=
to: 0x%x\n", task_proto);
dbf9bfe615717d jack wang       2009-10-14  468  		rc =3D -EINVAL;
dbf9bfe615717d jack wang       2009-10-14  469  		break;
dbf9bfe615717d jack wang       2009-10-14  470  	}
dbf9bfe615717d jack wang       2009-10-14  471  =

dbf9bfe615717d jack wang       2009-10-14  472  	if (rc) {
4a2efd4b89fcaa Viswas G        2020-11-02  473  		atomic_dec(&pm8001_dev->r=
unning_req);
e29c47fe8946cc Damien Le Moal  2022-02-20  474  		if (!sas_protocol_ata(tas=
k_proto) && n_elem)
e29c47fe8946cc Damien Le Moal  2022-02-20  475  			dma_unmap_sg(pm8001_ha->=
dev, task->scatter,
e29c47fe8946cc Damien Le Moal  2022-02-20  476  				     task->num_scatter,=
 task->data_dir);
99df0edb5a9849 Damien Le Moal  2022-02-20  477  err_out_ccb:
99df0edb5a9849 Damien Le Moal  2022-02-20  478  		pm8001_ccb_free(pm8001_ha=
, ccb);
e29c47fe8946cc Damien Le Moal  2022-02-20  479  =

dbf9bfe615717d jack wang       2009-10-14  480  err_out:
e29c47fe8946cc Damien Le Moal  2022-02-20  481  		pm8001_dbg(pm8001_ha, IO,=
 "pm8001_task_exec failed[%d]!\n", rc);
e29c47fe8946cc Damien Le Moal  2022-02-20  482  	}
e29c47fe8946cc Damien Le Moal  2022-02-20  483  =

dbf9bfe615717d jack wang       2009-10-14  484  	spin_unlock_irqrestore(&pm=
8001_ha->lock, flags);
e29c47fe8946cc Damien Le Moal  2022-02-20  485  =

dbf9bfe615717d jack wang       2009-10-14  486  	return rc;
dbf9bfe615717d jack wang       2009-10-14  487  }
dbf9bfe615717d jack wang       2009-10-14  488  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4422536266408311732==--

