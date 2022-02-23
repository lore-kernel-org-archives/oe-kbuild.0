Content-Type: multipart/mixed; boundary="===============4133613153607096484=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9747/9999] drivers/net/wireless/ath/ath11k/core.c:1364:3: warning: Value stored to 'fail_cont_count' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Feb 2022 07:53:42 +0800
Message-ID: <202202240747.qvC9PmYq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4133613153607096484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   322b0b1a25d03d537cfd59dedbb2ac6a642f1137
commit: da4be8dec6ed58e488189c2d7e13da7509552bb1 [9747/9999] BACKPORT: FROM=
LIST: ath11k: add support for device recovery for QCA6390/WCN6855
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20224/202202240747.qvC9PmYq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout da4be8dec6ed58e488189c2d7e13da7509552bb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   kernel/sched/fair.c:8678:11: note: 'sgs->group_type' is >=3D 'busiest->g=
roup_type'
           if (sgs->group_type < busiest->group_type)
                    ^
   kernel/sched/fair.c:8678:2: note: Taking false branch
           if (sgs->group_type < busiest->group_type)
           ^
   kernel/sched/fair.c:8686:2: note: Control jumps to 'case group_has_spare=
:'  at line 8730
           switch (sgs->group_type) {
           ^
   kernel/sched/fair.c:8738:12: note: 'sgs->idle_cpus' is <=3D 'busiest->id=
le_cpus'
                   if (sgs->idle_cpus > busiest->idle_cpus)
                            ^
   kernel/sched/fair.c:8738:3: note: Taking false branch
                   if (sgs->idle_cpus > busiest->idle_cpus)
                   ^
   kernel/sched/fair.c:8740:13: note: Assuming 'sgs->idle_cpus' is not equa=
l to 'busiest->idle_cpus'
                   else if ((sgs->idle_cpus =3D=3D busiest->idle_cpus) &&
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8740:51: note: Left side of '&&' is false
                   else if ((sgs->idle_cpus =3D=3D busiest->idle_cpus) &&
                                                                   ^
   kernel/sched/fair.c:8744:3: note:  Execution continues on line 8753
                   break;
                   ^
   kernel/sched/fair.c:8753:7: note: Assuming the condition is false
           if ((env->sd->flags & SD_ASYM_CPUCAPACITY) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8753:45: note: Left side of '&&' is false
           if ((env->sd->flags & SD_ASYM_CPUCAPACITY) &&
                                                      ^
   kernel/sched/fair.c:8758:2: note: Returning without writing to 'sg->next'
           return true;
           ^
   kernel/sched/fair.c:9139:7: note: Returning from 'update_sd_pick_busiest'
                   if (update_sd_pick_busiest(env, sds, sg, sgs)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9139:3: note: Taking true branch
                   if (update_sd_pick_busiest(env, sds, sg, sgs)) {
                   ^
   kernel/sched/fair.c:9149:3: note: Value assigned to 'sg'
                   sg =3D sg->next;
                   ^~~~~~~~~~~~~
   kernel/sched/fair.c:9150:11: note: Assuming 'sg' is not equal to field '=
groups'
           } while (sg !=3D env->sd->groups);
                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9119:2: note: Loop condition is true. Execution cont=
inues on line 9120
           do {
           ^
   kernel/sched/fair.c:9124:7: note: Assuming 'local_group' is 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9124:3: note: Taking false branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9133:32: note: Passing 'sg' via 3rd parameter 'group'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                                                ^~
   kernel/sched/fair.c:9133:3: note: Calling 'update_sg_lb_stats'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8575:16: note: Assuming 'group' is equal to field 'l=
ocal'
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8575:16: note: Assuming pointer value is null
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8577:2: note: Assuming 'i' is >=3D 'nr_cpu_ids'
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:314:3: note: expanded from macro 'for_each_cpu_a=
nd'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8577:2: note: Loop condition is false. Execution con=
tinues on line 8621
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:312:2: note: expanded from macro 'for_each_cpu_a=
nd'
           for ((cpu) =3D -1;                                              =
  \
           ^
   kernel/sched/fair.c:8621:24: note: Access to field 'sgc' results in a de=
reference of a null pointer (loaded from variable 'group')
           sgs->group_capacity =3D group->sgc->capacity;
                                 ^~~~~
   Suppressed 20 warnings (10 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/net/wireless/ath/ath11k/core.c:1364:3: warning: Value stored to =
'fail_cont_count' is never read [clang-analyzer-deadcode.DeadStores]
                   fail_cont_count =3D atomic_inc_return(&ab->fail_cont_cou=
nt);
                   ^
   drivers/net/wireless/ath/ath11k/core.c:1364:3: note: Value stored to 'fa=
il_cont_count' is never read
   Suppressed 17 warnings (17 in non-user code).
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
   18 warnings generated.
   net/mac80211/rc80211_minstrel_ht.c:943:18: warning: Access to field 'suc=
cess' results in a dereference of a null pointer (loaded from variable 'rat=
e') [clang-analyzer-core.NullDereference]
                           rate->success +=3D info->status.ampdu_ack_len;
                           ~~~~          ^
   net/mac80211/rc80211_minstrel_ht.c:900:6: note: Assuming field 'is_ht' i=
s true
           if (!msp->is_ht)
               ^~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:900:2: note: Taking false branch
           if (!msp->is_ht)
           ^
   net/mac80211/rc80211_minstrel_ht.c:906:7: note: Assuming the condition i=
s false
           if ((info->flags & IEEE80211_TX_CTL_AMPDU) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:906:45: note: Left side of '&&' is fa=
lse
           if ((info->flags & IEEE80211_TX_CTL_AMPDU) &&
                                                      ^
   net/mac80211/rc80211_minstrel_ht.c:910:6: note: Assuming the condition i=
s false
           if (!(info->flags & IEEE80211_TX_STAT_AMPDU)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:910:2: note: Taking false branch
           if (!(info->flags & IEEE80211_TX_STAT_AMPDU)) {
           ^
   net/mac80211/rc80211_minstrel_ht.c:919:6: note: Assuming field 'sample_w=
ait' is not equal to 0
           if (!mi->sample_wait && !mi->sample_tries && mi->sample_count > =
0) {
               ^~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:919:23: note: Left side of '&&' is fa=
lse
           if (!mi->sample_wait && !mi->sample_tries && mi->sample_count > =
0) {
                                ^
   net/mac80211/rc80211_minstrel_ht.c:927:6: note: Assuming the condition i=
s false
           if (info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:927:2: note: Taking false branch
           if (info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE)
           ^
   net/mac80211/rc80211_minstrel_ht.c:930:6: note: Assuming field 'sample_m=
ode' is equal to MINSTREL_SAMPLE_IDLE
           if (mi->sample_mode !=3D MINSTREL_SAMPLE_IDLE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:930:2: note: Taking false branch
           if (mi->sample_mode !=3D MINSTREL_SAMPLE_IDLE)
           ^
   net/mac80211/rc80211_minstrel_ht.c:933:10: note: Calling 'minstrel_ht_tx=
stat_valid'
           last =3D !minstrel_ht_txstat_valid(mp, &ar[0]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:800:6: note: Assuming field 'idx' is =
>=3D 0
           if (rate->idx < 0)
               ^~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:800:2: note: Taking false branch
           if (rate->idx < 0)
           ^
   net/mac80211/rc80211_minstrel_ht.c:803:6: note: Assuming field 'count' i=
s not equal to 0, which participates in a condition later
           if (!rate->count)
               ^~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:803:2: note: Taking false branch
           if (!rate->count)
           ^
   net/mac80211/rc80211_minstrel_ht.c:806:6: note: Assuming the condition i=
s false
           if (rate->flags & IEEE80211_TX_RC_MCS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:806:6: note: Left side of '||' is fal=
se
   net/mac80211/rc80211_minstrel_ht.c:807:6: note: Assuming the condition i=
s false
               rate->flags & IEEE80211_TX_RC_VHT_MCS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:806:2: note: Taking false branch
           if (rate->flags & IEEE80211_TX_RC_MCS ||
           ^
   net/mac80211/rc80211_minstrel_ht.c:810:9: note: Assuming the condition i=
s false
           return rate->idx =3D=3D mp->cck_rates[0] ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:810:9: note: Left side of '||' is fal=
se
   net/mac80211/rc80211_minstrel_ht.c:811:9: note: Assuming the condition i=
s true
                  rate->idx =3D=3D mp->cck_rates[1] ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:811:39: note: Left side of '||' is tr=
ue
                  rate->idx =3D=3D mp->cck_rates[1] ||
                                                ^
   net/mac80211/rc80211_minstrel_ht.c:810:2: note: Returning the value 1, w=
hich participates in a condition later
           return rate->idx =3D=3D mp->cck_rates[0] ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:933:10: note: Returning from 'minstre=
l_ht_txstat_valid'
           last =3D !minstrel_ht_txstat_valid(mp, &ar[0]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rc80211_minstrel_ht.c:934:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; !last; i++) {
           ^
   net/mac80211/rc80211_minstrel_ht.c:935:10: note: Left side of '||' is fa=
lse
                   last =3D (i =3D=3D IEEE80211_TX_MAX_RATES - 1) ||

vim +/fail_cont_count +1364 drivers/net/wireless/ath/ath11k/core.c

d5c65159f28953 Kalle Valo 2019-11-23  1319  =

da4be8dec6ed58 Wen Gong   2022-02-09  1320  static void ath11k_core_reset(s=
truct work_struct *work)
da4be8dec6ed58 Wen Gong   2022-02-09  1321  {
da4be8dec6ed58 Wen Gong   2022-02-09  1322  	struct ath11k_base *ab =3D con=
tainer_of(work, struct ath11k_base, reset_work);
da4be8dec6ed58 Wen Gong   2022-02-09  1323  	int reset_count, fail_cont_cou=
nt;
da4be8dec6ed58 Wen Gong   2022-02-09  1324  	long time_left;
da4be8dec6ed58 Wen Gong   2022-02-09  1325  =

da4be8dec6ed58 Wen Gong   2022-02-09  1326  	if (!(test_bit(ATH11K_FLAG_REG=
ISTERED, &ab->dev_flags))) {
da4be8dec6ed58 Wen Gong   2022-02-09  1327  		ath11k_warn(ab, "ignore reset=
 dev flags 0x%lx\n", ab->dev_flags);
da4be8dec6ed58 Wen Gong   2022-02-09  1328  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1329  	}
da4be8dec6ed58 Wen Gong   2022-02-09  1330  =

da4be8dec6ed58 Wen Gong   2022-02-09  1331  	/* Sometimes the recovery will=
 fail and then the next all recovery fail,
da4be8dec6ed58 Wen Gong   2022-02-09  1332  	 * this is to avoid infinite r=
ecovery since it can not recovery success.
da4be8dec6ed58 Wen Gong   2022-02-09  1333  	 */
da4be8dec6ed58 Wen Gong   2022-02-09  1334  	fail_cont_count =3D atomic_rea=
d(&ab->fail_cont_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1335  =

da4be8dec6ed58 Wen Gong   2022-02-09  1336  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FINAL)
da4be8dec6ed58 Wen Gong   2022-02-09  1337  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1338  =

da4be8dec6ed58 Wen Gong   2022-02-09  1339  	if (fail_cont_count >=3D ATH11=
K_RESET_MAX_FAIL_COUNT_FIRST &&
da4be8dec6ed58 Wen Gong   2022-02-09  1340  	    time_before(jiffies, ab->r=
eset_fail_timeout))
da4be8dec6ed58 Wen Gong   2022-02-09  1341  		return;
da4be8dec6ed58 Wen Gong   2022-02-09  1342  =

da4be8dec6ed58 Wen Gong   2022-02-09  1343  	reset_count =3D atomic_inc_ret=
urn(&ab->reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1344  =

da4be8dec6ed58 Wen Gong   2022-02-09  1345  	if (reset_count > 1) {
da4be8dec6ed58 Wen Gong   2022-02-09  1346  		/* Sometimes it happened anot=
her reset worker before the previous one
da4be8dec6ed58 Wen Gong   2022-02-09  1347  		 * completed, then the second=
 reset worker will destroy the previous one,
da4be8dec6ed58 Wen Gong   2022-02-09  1348  		 * thus below is to avoid tha=
t.
da4be8dec6ed58 Wen Gong   2022-02-09  1349  		 */
da4be8dec6ed58 Wen Gong   2022-02-09  1350  		ath11k_warn(ab, "already rese=
ting count %d\n", reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1351  =

da4be8dec6ed58 Wen Gong   2022-02-09  1352  		reinit_completion(&ab->reset_=
complete);
da4be8dec6ed58 Wen Gong   2022-02-09  1353  		time_left =3D wait_for_comple=
tion_timeout(&ab->reset_complete,
da4be8dec6ed58 Wen Gong   2022-02-09  1354  							ATH11K_RESET_TIMEOUT_HZ);
da4be8dec6ed58 Wen Gong   2022-02-09  1355  =

da4be8dec6ed58 Wen Gong   2022-02-09  1356  		if (time_left) {
da4be8dec6ed58 Wen Gong   2022-02-09  1357  			ath11k_dbg(ab, ATH11K_DBG_BO=
OT, "to skip reset\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1358  			atomic_dec(&ab->reset_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1359  			return;
da4be8dec6ed58 Wen Gong   2022-02-09  1360  		}
da4be8dec6ed58 Wen Gong   2022-02-09  1361  =

da4be8dec6ed58 Wen Gong   2022-02-09  1362  		ab->reset_fail_timeout =3D ji=
ffies + ATH11K_RESET_FAIL_TIMEOUT_HZ;
da4be8dec6ed58 Wen Gong   2022-02-09  1363  		/* Record the continuous reco=
very fail count when recovery failed*/
da4be8dec6ed58 Wen Gong   2022-02-09 @1364  		fail_cont_count =3D atomic_in=
c_return(&ab->fail_cont_count);
da4be8dec6ed58 Wen Gong   2022-02-09  1365  	}
da4be8dec6ed58 Wen Gong   2022-02-09  1366  =

da4be8dec6ed58 Wen Gong   2022-02-09  1367  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset starting\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1368  =

da4be8dec6ed58 Wen Gong   2022-02-09  1369  	ab->is_reset =3D true;
da4be8dec6ed58 Wen Gong   2022-02-09  1370  	atomic_set(&ab->recovery_count=
, 0);
da4be8dec6ed58 Wen Gong   2022-02-09  1371  =

da4be8dec6ed58 Wen Gong   2022-02-09  1372  	ath11k_hif_power_down(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1373  	ath11k_qmi_free_resource(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1374  	ath11k_hif_power_up(ab);
da4be8dec6ed58 Wen Gong   2022-02-09  1375  =

da4be8dec6ed58 Wen Gong   2022-02-09  1376  	ath11k_dbg(ab, ATH11K_DBG_BOOT=
, "reset started\n");
da4be8dec6ed58 Wen Gong   2022-02-09  1377  }
da4be8dec6ed58 Wen Gong   2022-02-09  1378  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4133613153607096484==--

