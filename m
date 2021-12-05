Content-Type: multipart/mixed; boundary="===============4698115363971946591=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
Date: Sun, 05 Dec 2021 09:43:19 +0800
Message-ID: <202112050932.BQQ8v5Zy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4698115363971946591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203023728.3699610-2-suichen@google.com>
References: <20211203023728.3699610-2-suichen@google.com>
TO: Sui Chen <suichen@google.com>

Hi Sui,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-202112=
03]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Chen/I2C-statistics-as=
-sysfs-attributes/20211203-103913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211203 (https://download.01.org/0day-ci/archi=
ve/20211205/202112050932.BQQ8v5Zy-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b=
06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/16ccbe6d6d8b9a6e81ba9f40b=
70d3af92d04776e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Chen/I2C-statistics-as-sysfs-a=
ttributes/20211203-103913
        git checkout 16ccbe6d6d8b9a6e81ba9f40b70d3af92d04776e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   kernel/sched/fair.c:7052:37: warning: Access to field 'vruntime' results=
 in a dereference of a null pointer (loaded from variable 'se') [clang-anal=
yzer-core.NullDereference]
           s64 gran, vdiff =3D curr->vruntime - se->vruntime;
                                              ^
   kernel/sched/fair.c:7371:9: note: Calling 'pick_next_task_fair'
           return pick_next_task_fair(rq, NULL, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7234:7: note: Calling 'sched_fair_runnable'
           if (!sched_fair_runnable(rq))
                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2221:9: note: Assuming field 'nr_running' is > 0
           return rq->cfs.nr_running > 0;
                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2221:2: note: Returning without writing to 'rq->cfs=
.tasks_timeline.rb_leftmost', which participates in a condition later
           return rq->cfs.nr_running > 0;
           ^
   kernel/sched/sched.h:2221:2: note: Returning without writing to 'rq->cfs=
.next', which participates in a condition later
   kernel/sched/fair.c:7234:7: note: Returning from 'sched_fair_runnable'
           if (!sched_fair_runnable(rq))
                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7234:2: note: Taking false branch
           if (!sched_fair_runnable(rq))
           ^
   kernel/sched/fair.c:7315:6: note: 'prev' is null
           if (prev)
               ^~~~
   kernel/sched/fair.c:7315:2: note: Taking false branch
           if (prev)
           ^
   kernel/sched/fair.c:7319:33: note: Passing null pointer value via 2nd pa=
rameter 'curr'
                   se =3D pick_next_entity(cfs_rq, NULL);
                                                 ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   kernel/sched/fair.c:7319:8: note: Calling 'pick_next_entity'
                   se =3D pick_next_entity(cfs_rq, NULL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4474:30: note: Calling '__pick_first_entity'
           struct sched_entity *left =3D __pick_first_entity(cfs_rq);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:600:6: note: Assuming 'left' is null
           if (!left)
               ^~~~~
   kernel/sched/fair.c:600:2: note: Taking true branch
           if (!left)
           ^
   kernel/sched/fair.c:601:3: note: Returning without writing to 'cfs_rq->n=
ext', which participates in a condition later
                   return NULL;
                   ^
   kernel/sched/fair.c:601:3: note: Returning null pointer, which participa=
tes in a condition later
                   return NULL;
                   ^~~~~~~~~~~
   kernel/sched/fair.c:4474:30: note: Returning from '__pick_first_entity'
           struct sched_entity *left =3D __pick_first_entity(cfs_rq);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4481:7: note: 'left' is null
           if (!left || (curr && entity_before(curr, left)))
                ^~~~
   kernel/sched/fair.c:4481:12: note: Left side of '||' is true
           if (!left || (curr && entity_before(curr, left)))
                     ^
   kernel/sched/fair.c:4482:3: note: Null pointer value stored to 'left'
                   left =3D curr;
                   ^~~~~~~~~~~
   kernel/sched/fair.c:4490:6: note: Assuming field 'skip' is null
           if (cfs_rq->skip && cfs_rq->skip =3D=3D se) {
               ^~~~~~~~~~~~
   kernel/sched/fair.c:4490:19: note: Left side of '&&' is false
           if (cfs_rq->skip && cfs_rq->skip =3D=3D se) {
                            ^
   kernel/sched/fair.c:4505:6: note: Assuming field 'next' is non-null
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
               ^~~~~~~~~~~~
   kernel/sched/fair.c:4505:6: note: Left side of '&&' is true
   kernel/sched/fair.c:4505:58: note: Passing null pointer value via 2nd pa=
rameter 'se'
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
                                                                   ^~~~
   kernel/sched/fair.c:4505:22: note: Calling 'wakeup_preempt_entity'
           if (cfs_rq->next && wakeup_preempt_entity(cfs_rq->next, left) < =
1) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7052:37: note: Access to field 'vruntime' results in=
 a dereference of a null pointer (loaded from variable 'se')
           s64 gran, vdiff =3D curr->vruntime - se->vruntime;
                                              ^~
   Suppressed 23 warnings (4 in non-user code, 19 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/i2c/i2c-dev.c:866:6: warning: Branch condition evaluates to a ga=
rbage value [clang-analyzer-core.uninitialized.Branch]
           if (ret) {
               ^~~
   drivers/i2c/i2c-dev.c:838:2: note: 'ret' declared without an initial val=
ue
           int ret;
           ^~~~~~~
   drivers/i2c/i2c-dev.c:839:6: note: Assuming field 'stats' is not equal t=
o NULL
           if (adapter->stats =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:839:2: note: Taking false branch
           if (adapter->stats =3D=3D NULL) {
           ^
   drivers/i2c/i2c-dev.c:843:6: note: Assuming the condition is false
           if (!strcmp(counter_name, "ber_cnt")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:843:2: note: Taking false branch
           if (!strcmp(counter_name, "ber_cnt")) {
           ^
   drivers/i2c/i2c-dev.c:846:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "nack_cnt")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:846:9: note: Taking false branch
           } else if (!strcmp(counter_name, "nack_cnt")) {
                  ^
   drivers/i2c/i2c-dev.c:849:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "rec_succ_cnt")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:849:9: note: Taking false branch
           } else if (!strcmp(counter_name, "rec_succ_cnt")) {
                  ^
   drivers/i2c/i2c-dev.c:852:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "rec_fail_cnt")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:852:9: note: Taking false branch
           } else if (!strcmp(counter_name, "rec_fail_cnt")) {
                  ^
   drivers/i2c/i2c-dev.c:855:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "timeout_cnt")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:855:9: note: Taking false branch
           } else if (!strcmp(counter_name, "timeout_cnt")) {
                  ^
   drivers/i2c/i2c-dev.c:858:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "i2c_speed")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:858:9: note: Taking false branch
           } else if (!strcmp(counter_name, "i2c_speed")) {
                  ^
   drivers/i2c/i2c-dev.c:861:13: note: Assuming the condition is false
           } else if (!strcmp(counter_name, "tx_complete_cnt")) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-dev.c:861:9: note: Taking false branch
           } else if (!strcmp(counter_name, "tx_complete_cnt")) {
                  ^
   drivers/i2c/i2c-dev.c:866:6: note: Branch condition evaluates to a garba=
ge value
           if (ret) {
               ^~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/media/dvb-frontends/rtl2832.c:145:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:145:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:175:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:175:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:214:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:214:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:248:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:248:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:372:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:372:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:394:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:394:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/rtl2832.c:528:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;

vim +866 drivers/i2c/i2c-dev.c

16ccbe6d6d8b9a Sui Chen 2021-12-02  835  =

16ccbe6d6d8b9a Sui Chen 2021-12-02  836  void i2c_adapter_stats_register_co=
unter(struct i2c_adapter* adapter,
16ccbe6d6d8b9a Sui Chen 2021-12-02  837  	const char* counter_name, void* d=
ata_source) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  838  	int ret;
16ccbe6d6d8b9a Sui Chen 2021-12-02  839  	if (adapter->stats =3D=3D NULL) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  840  		i2c_adapter_create_stats_folder(=
adapter);
16ccbe6d6d8b9a Sui Chen 2021-12-02  841  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  842  =

16ccbe6d6d8b9a Sui Chen 2021-12-02  843  	if (!strcmp(counter_name, "ber_cn=
t")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  844  		adapter->stats->ber_cnt =3D data=
_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  845  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_ber_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  846  	} else if (!strcmp(counter_name, =
"nack_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  847  		adapter->stats->nack_cnt =3D dat=
a_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  848  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_nack_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  849  	} else if (!strcmp(counter_name, =
"rec_succ_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  850  		adapter->stats->rec_succ_cnt =3D=
 data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  851  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_rec_succ_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  852  	} else if (!strcmp(counter_name, =
"rec_fail_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  853  		adapter->stats->rec_fail_cnt =3D=
 data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  854  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_rec_fail_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  855  	} else if (!strcmp(counter_name, =
"timeout_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  856  		adapter->stats->timeout_cnt =3D =
data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  857  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_timeout_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  858  	} else if (!strcmp(counter_name, =
"i2c_speed")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  859  		adapter->stats->i2c_speed =3D da=
ta_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  860  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_i2c_speed.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  861  	} else if (!strcmp(counter_name, =
"tx_complete_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  862  		adapter->stats->tx_complete_cnt =
=3D data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  863  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_tx_complete_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  864  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  865  =

16ccbe6d6d8b9a Sui Chen 2021-12-02 @866  	if (ret) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  867  		printk("Failed to create sysfs f=
ile for %s", counter_name);
16ccbe6d6d8b9a Sui Chen 2021-12-02  868  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  869  }
16ccbe6d6d8b9a Sui Chen 2021-12-02  870  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4698115363971946591==--

