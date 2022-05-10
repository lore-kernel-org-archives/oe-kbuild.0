Content-Type: multipart/mixed; boundary="===============8562827822212376542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v3 11/14] drivers/scsi/ufs/ufshcd.c:1512:32: warning: Access to field 'min_freq' results in a dereference of an undefined pointer value (loaded from variable 'clki') [clang-analyzer-core.NullDereference]
Date: Wed, 11 May 2022 03:10:42 +0800
Message-ID: <202205110341.VeWii6OQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8562827822212376542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v3
head:   e2d140aa302e460faba90ed1bf20034addacc1cf
commit: 82c05426be0071861d3c729bb24fb4aec156ca1a [11/14] ufs: use PM OPP wh=
en scaling gears
:::::: branch date: 5 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205110341.VeWii6OQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd12=
3c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/82c05426be0071861d3c729bb24f=
b4aec156ca1a
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v3
        git checkout 82c05426be0071861d3c729bb24fb4aec156ca1a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   109 warnings generated.
   net/ipv6/ipv6_sockglue.c:701:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&fl6, 0, sizeof(fl6));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:701:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(&fl6, 0, sizeof(fl6));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:720:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(opt, 0, sizeof(*opt));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:720:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(opt, 0, sizeof(*opt));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:1319:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&mtuinfo, 0, sizeof(mtuinfo));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:1319:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&mtuinfo, 0, sizeof(mtuinfo));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:1417:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&freq, 0, sizeof(freq));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/ipv6_sockglue.c:1417:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&freq, 0, sizeof(freq));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 105 warnings (105 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   110 warnings generated.
   drivers/scsi/ufs/ufshcd.c:1195:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info.i=
nfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1195:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info.i=
nfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1198:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &hba->pwr_info,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1198:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &hba->pwr_info,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1204:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&hba->clk_scaling.saved_pwr_info.info,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1204:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&hba->clk_scaling.saved_pwr_info.info,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1442:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(*stat));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1442:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(stat, 0, sizeof(*stat));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/scsi/ufs/ufshcd.c:1512:32: warning: Access to field 'min_freq' r=
esults in a dereference of an undefined pointer value (loaded from variable=
 'clki') [clang-analyzer-core.NullDereference]
                           dev_pm_opp_remove(hba->dev, clki->min_freq);
                                                       ^
   drivers/scsi/ufs/ufshcd.c:8285:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshcd.c:8285:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshcd.c:8289:8: note: Calling 'ufshcd_add_lus'
           ret =3D ufshcd_add_lus(hba);
                 ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8142:8: note: Calling 'ufshcd_scsi_add_wlus'
           ret =3D ufshcd_scsi_add_wlus(hba);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:7574:2: note: Taking false branch
           if (IS_ERR(hba->ufs_device_wlun)) {
           ^
   drivers/scsi/ufs/ufshcd.c:7583:2: note: Taking false branch
           if (IS_ERR(sdev_rpmb)) {
           ^
   drivers/scsi/ufs/ufshcd.c:7592:2: note: Taking true branch
           if (IS_ERR(sdev_boot)) {
           ^
   drivers/scsi/ufs/ufshcd.c:7593:3: note: Loop condition is false.  Exitin=
g loop
                   dev_err(hba->dev, "%s: BOOT WLUN not found\n", __func__);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:442:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/scsi/ufs/ufshcd.c:7598:2: note: Control jumps to line 7603
           goto out;
           ^
   drivers/scsi/ufs/ufshcd.c:7603:2: note: Returning without writing to 'hb=
a->use_pm_opp', which participates in a condition later
           return ret;
           ^
   drivers/scsi/ufs/ufshcd.c:8142:8: note: Returning from 'ufshcd_scsi_add_=
wlus'
           ret =3D ufshcd_scsi_add_wlus(hba);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8143:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshcd.c:8143:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshcd.c:8147:6: note: Calling 'ufshcd_is_clkscaling_su=
pported'
           if (ufshcd_is_clkscaling_supported(hba)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.h:973:2: note: Returning without writing to 'hba=
->use_pm_opp', which participates in a condition later
           return hba->caps & UFSHCD_CAP_CLK_SCALING;
           ^
   drivers/scsi/ufs/ufshcd.c:8147:6: note: Returning from 'ufshcd_is_clksca=
ling_supported'
           if (ufshcd_is_clkscaling_supported(hba)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8147:6: note: Assuming the condition is true
           if (ufshcd_is_clkscaling_supported(hba)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8147:2: note: Taking true branch
           if (ufshcd_is_clkscaling_supported(hba)) {
           ^
   drivers/scsi/ufs/ufshcd.c:8154:9: note: Calling 'ufshcd_devfreq_init'
                   ret =3D ufshcd_devfreq_init(hba);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1487:2: note: 'clki' declared without an initi=
al value
           struct ufs_clk_info *clki;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1492:6: note: Assuming the condition is false
           if (list_empty(clk_list))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1492:2: note: Taking false branch
           if (list_empty(clk_list))
           ^
   drivers/scsi/ufs/ufshcd.c:1495:6: note: Assuming field 'use_pm_opp' is t=
rue
           if (!hba->use_pm_opp) {
               ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1495:2: note: Taking false branch
           if (!hba->use_pm_opp) {
           ^
   drivers/scsi/ufs/ufshcd.c:1501:2: note: Calling 'ufshcd_vops_config_scal=
ing_param'
           ufshcd_vops_config_scaling_param(hba, &hba->vps->devfreq_profile,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd-priv.h:214:6: note: Assuming field 'vops' is non=
-null
           if (hba->vops && hba->vops->config_scaling_param)
               ^~~~~~~~~
   drivers/scsi/ufs/ufshcd-priv.h:214:6: note: Left side of '&&' is true
   drivers/scsi/ufs/ufshcd-priv.h:214:19: note: Assuming field 'config_scal=
ing_param' is non-null
           if (hba->vops && hba->vops->config_scaling_param)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd-priv.h:214:2: note: Taking true branch

vim +1512 drivers/scsi/ufs/ufshcd.c

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1430  =

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1431  static int ufshcd_dev=
freq_get_dev_status(struct device *dev,
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1432  		struct devfreq_dev_=
status *stat)
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1433  {
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1434  	struct ufs_hba *hba =
=3D dev_get_drvdata(dev);
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1435  	struct ufs_clk_scali=
ng *scaling =3D &hba->clk_scaling;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1436  	unsigned long flags;
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1437  	ktime_t curr_t;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1438  =

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1439  	if (!ufshcd_is_clksc=
aling_supported(hba))
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1440  		return -EINVAL;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1441  =

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03 @1442  	memset(stat, 0, size=
of(*stat));
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1443  =

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1444  	spin_lock_irqsave(hb=
a->host->host_lock, flags);
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1445  	curr_t =3D ktime_get=
();
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1446  	if (!scaling->window=
_start_t)
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1447  		goto start_window;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1448  =

82c05426be00718 Krzysztof Kozlowski 2022-04-01  1449  	if (hba->use_pm_opp)=
 {
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1450  		stat->current_frequ=
ency =3D hba->clk_scaling.target_freq;
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1451  	} else {
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1452  		struct list_head *c=
lk_list =3D &hba->clk_list_head;
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1453  		struct ufs_clk_info=
 *clki;
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1454  =

91831d3336627ff Asutosh Das         2020-03-25  1455  		clki =3D list_first=
_entry(clk_list, struct ufs_clk_info, list);
91831d3336627ff Asutosh Das         2020-03-25  1456  		/*
91831d3336627ff Asutosh Das         2020-03-25  1457  		 * If current frequ=
ency is 0, then the ondemand governor considers
91831d3336627ff Asutosh Das         2020-03-25  1458  		 * there's no initi=
al frequency set. And it always requests to set
91831d3336627ff Asutosh Das         2020-03-25  1459  		 * to max. frequenc=
y.
91831d3336627ff Asutosh Das         2020-03-25  1460  		 */
91831d3336627ff Asutosh Das         2020-03-25  1461  		stat->current_frequ=
ency =3D clki->curr_freq;
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1462  	}
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1463  	if (scaling->is_busy=
_started)
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1464  		scaling->tot_busy_t=
 +=3D ktime_us_delta(curr_t,
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1465  				scaling->busy_sta=
rt_t);
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1466  =

b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1467  	stat->total_time =3D=
 ktime_us_delta(curr_t, scaling->window_start_t);
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1468  	stat->busy_time =3D =
scaling->tot_busy_t;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1469  start_window:
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1470  	scaling->window_star=
t_t =3D curr_t;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1471  	scaling->tot_busy_t =
=3D 0;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1472  =

a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1473  	if (hba->outstanding=
_reqs) {
b1bf66d1d5a8fcb Stanley Chu         2020-06-11  1474  		scaling->busy_start=
_t =3D curr_t;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1475  		scaling->is_busy_st=
arted =3D true;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1476  	} else {
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1477  		scaling->busy_start=
_t =3D 0;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1478  		scaling->is_busy_st=
arted =3D false;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1479  	}
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1480  	spin_unlock_irqresto=
re(hba->host->host_lock, flags);
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1481  	return 0;
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1482  }
a3cd5ec55f6c728 Subhash Jadavani    2017-02-03  1483  =

deac444f4e44c40 Bjorn Andersson     2018-05-17  1484  static int ufshcd_dev=
freq_init(struct ufs_hba *hba)
deac444f4e44c40 Bjorn Andersson     2018-05-17  1485  {
092b45583c524ed Bjorn Andersson     2018-05-17  1486  	struct list_head *cl=
k_list =3D &hba->clk_list_head;
092b45583c524ed Bjorn Andersson     2018-05-17  1487  	struct ufs_clk_info =
*clki;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1488  	struct devfreq *devf=
req;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1489  	int ret;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1490  =

092b45583c524ed Bjorn Andersson     2018-05-17  1491  	/* Skip devfreq if w=
e don't have any clocks in the list */
092b45583c524ed Bjorn Andersson     2018-05-17  1492  	if (list_empty(clk_l=
ist))
092b45583c524ed Bjorn Andersson     2018-05-17  1493  		return 0;
092b45583c524ed Bjorn Andersson     2018-05-17  1494  =

82c05426be00718 Krzysztof Kozlowski 2022-04-01  1495  	if (!hba->use_pm_opp=
) {
092b45583c524ed Bjorn Andersson     2018-05-17  1496  		clki =3D list_first=
_entry(clk_list, struct ufs_clk_info, list);
092b45583c524ed Bjorn Andersson     2018-05-17  1497  		dev_pm_opp_add(hba-=
>dev, clki->min_freq, 0);
092b45583c524ed Bjorn Andersson     2018-05-17  1498  		dev_pm_opp_add(hba-=
>dev, clki->max_freq, 0);
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1499  	}
092b45583c524ed Bjorn Andersson     2018-05-17  1500  =

90b8491c0033915 Stanley Chu         2020-05-09  1501  	ufshcd_vops_config_s=
caling_param(hba, &hba->vps->devfreq_profile,
90b8491c0033915 Stanley Chu         2020-05-09  1502  					 &hba->vps->onde=
mand_data);
092b45583c524ed Bjorn Andersson     2018-05-17  1503  	devfreq =3D devfreq_=
add_device(hba->dev,
90b8491c0033915 Stanley Chu         2020-05-09  1504  			&hba->vps->devfreq=
_profile,
deac444f4e44c40 Bjorn Andersson     2018-05-17  1505  			DEVFREQ_GOV_SIMPLE=
_ONDEMAND,
90b8491c0033915 Stanley Chu         2020-05-09  1506  			&hba->vps->ondeman=
d_data);
deac444f4e44c40 Bjorn Andersson     2018-05-17  1507  	if (IS_ERR(devfreq))=
 {
deac444f4e44c40 Bjorn Andersson     2018-05-17  1508  		ret =3D PTR_ERR(dev=
freq);
deac444f4e44c40 Bjorn Andersson     2018-05-17  1509  		dev_err(hba->dev, "=
Unable to register with devfreq %d\n", ret);
092b45583c524ed Bjorn Andersson     2018-05-17  1510  =

82c05426be00718 Krzysztof Kozlowski 2022-04-01  1511  		if (!hba->use_pm_op=
p) {
092b45583c524ed Bjorn Andersson     2018-05-17 @1512  			dev_pm_opp_remove(=
hba->dev, clki->min_freq);
092b45583c524ed Bjorn Andersson     2018-05-17  1513  			dev_pm_opp_remove(=
hba->dev, clki->max_freq);
82c05426be00718 Krzysztof Kozlowski 2022-04-01  1514  		}
deac444f4e44c40 Bjorn Andersson     2018-05-17  1515  		return ret;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1516  	}
deac444f4e44c40 Bjorn Andersson     2018-05-17  1517  =

deac444f4e44c40 Bjorn Andersson     2018-05-17  1518  	hba->devfreq =3D dev=
freq;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1519  =

deac444f4e44c40 Bjorn Andersson     2018-05-17  1520  	return 0;
deac444f4e44c40 Bjorn Andersson     2018-05-17  1521  }
deac444f4e44c40 Bjorn Andersson     2018-05-17  1522  =


:::::: The code at line 1512 was first introduced by commit
:::::: 092b45583c524edac688f0b6cdc62a70c3081e4a scsi: ufs: Use freq table w=
ith devfreq

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8562827822212376542==--

