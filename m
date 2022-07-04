Content-Type: multipart/mixed; boundary="===============7427021822479670271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/devfreq/governor_passive.c:44:24: warning: Uninitialized variable: parent_cpu_data->opp_table [uninitvar]
Date: Mon, 04 Jul 2022 20:14:24 +0800
Message-ID: <202207042022.XYuGdExy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7427021822479670271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/d=
evfreq/governor_passive.c:44:24: warning: Uninitialized variable: parent_cp=
u_data->opp_table [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian 'Ansuel' Marangi" <ansuelsmth@gmail.com>
CC: Chanwoo Choi <cw00.choi@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88084a3df1672e131ddc1b4e39eeacfd39864acf
commit: 0cca7e8dcfa9e6fe7ba697e534a732571f1689d0 PM / devfreq: Fix cpufreq =
passive unregister erroring on PROBE_DEFER
date:   5 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0cca7e8dcfa9e6fe7ba697e534a732571f1689d0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/devfreq/governor_passive.c:44:24: warning: Uninitialized variabl=
e: parent_cpu_data->opp_table [uninitvar]
     if (parent_cpu_data->opp_table)
                          ^
--
>> drivers/gpu/drm/drm_of.c:30:28: warning: Parameter 'port' can be declare=
d with const [constParameter]
          struct device_node *port)
                              ^
--
>> drivers/gpu/drm/arm/display/komeda/komeda_plane.c:199:34: warning: Param=
eter 'pipe' can be declared with const [constParameter]
            struct komeda_pipeline *pipe)
                                    ^
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c:217:31: warning: Param=
eter 'pipe' can be declared with const [constParameter]
         struct komeda_pipeline *pipe,
                                 ^
--
>> drivers/gpu/drm/arm/malidp_planes.c:407:18: warning: Redundant condition=
: afbc. '!afbc || (afbc && sparse)' is equivalent to '!afbc || sparse' [red=
undantCondition]
     return (!afbc) || (afbc && sparse);
                    ^
--
>> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:155:6: warning: The if cond=
ition is the same as the previous if condition [duplicateCondition]
    if (enable)
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:144:6: note: First condition
    if (enable) {
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:155:6: note: Second conditi=
on
    if (enable)
        ^
>> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:263:16: warning: Uninitiali=
zed variable: config.csc_coefficents [uninitvar]
           config.csc_coefficents,
                  ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:218:6: note: Assuming condi=
tion is true
    if (rgb) {
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:263:16: note: Uninitialized=
 variable: config.csc_coefficents
           config.csc_coefficents,
                  ^
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:1114:10: warning: Pa=
rameter 'before_cr' can be declared with const [constParameter]
         u8 before_cr[CDNS_DP_MAX_NUM_LANES],
            ^
--
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:5128:34: warning: Paramete=
r 'branch' can be declared with const [constParameter]
          struct drm_dp_mst_branch *branch)
                                    ^

vim +44 drivers/devfreq/governor_passive.c

26984d9d581e50 Chanwoo Choi      2022-04-27  36  =

0cca7e8dcfa9e6 Christian Marangi 2022-06-15  37  static void delete_parent_=
cpu_data(struct devfreq_passive_data *p_data)
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  38  {
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  39  	struct devfreq_cpu_data *=
parent_cpu_data, *tmp;
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  40  =

0cca7e8dcfa9e6 Christian Marangi 2022-06-15  41  	list_for_each_entry_safe(=
parent_cpu_data, tmp, &p_data->cpu_data_list, node) {
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  42  		list_del(&parent_cpu_dat=
a->node);
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  43  =

0cca7e8dcfa9e6 Christian Marangi 2022-06-15 @44  		if (parent_cpu_data->opp=
_table)
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  45  			dev_pm_opp_put_opp_tabl=
e(parent_cpu_data->opp_table);
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  46  =

0cca7e8dcfa9e6 Christian Marangi 2022-06-15  47  		kfree(parent_cpu_data);
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  48  	}
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  49  }
0cca7e8dcfa9e6 Christian Marangi 2022-06-15  50  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7427021822479670271==--

