Content-Type: multipart/mixed; boundary="===============2038458489438483164=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vireshk-pm:cpufreq/arm/linux-next 24/24] drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line 190
Date: Sat, 07 May 2022 04:58:56 +0800
Message-ID: <202205070404.vpgtRaCF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2038458489438483164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
CC: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpuf=
req/arm/linux-next
head:   c210063b40acab74bb7262d2bfae557171884ff2
commit: c210063b40acab74bb7262d2bfae557171884ff2 [24/24] cpufreq: mediatek:=
 Add opp notification support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/2022050=
7/202205070404.vpgtRaCF-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line 190
   drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line 190

vim +199 drivers/cpufreq/mediatek-cpufreq.c

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 173  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 174  static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 175  				  unsigned int index)
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 176  {
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 177  	struct cpufreq_frequency_table *freq_table =3D policy->freq_table;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 178  	struct clk *cpu_clk =3D policy->clk;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 179  	struct clk *armpll =3D clk_get_parent(cpu_clk);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 180  	struct mtk_cpu_dvfs_info *info =3D policy->driver_data;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 181  	struct device *cpu_dev =3D info->cpu_dev;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 182  	struct dev_pm_opp *opp;
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 183  	long freq_hz, pre_freq_hz;
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 184  	int vproc, pre_vproc, inter_vproc, target_vproc, ret;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 185  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 186  	inter_vproc =3D info->intermediate_voltage;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 187  =

4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 188  	pre_freq_hz =3D clk_get_rate(cpu_clk);
bffcd33313dcfa drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22 =
 189  =

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
@190  	mutex_lock(&info->reg_lock);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 191  =

bffcd33313dcfa drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22 =
 192  	if (unlikely(info->pre_vproc <=3D 0))
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 193  		pre_vproc =3D regulator_get_voltage(info->proc_reg);
bffcd33313dcfa drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22 =
 194  	else
bffcd33313dcfa drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22 =
 195  		pre_vproc =3D info->pre_vproc;
bffcd33313dcfa drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-04-22 =
 196  =

4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 197  	if (pre_vproc < 0) {
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 198  		dev_err(cpu_dev, "invalid Vproc value: %d\n", pre_vproc);
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
@199  		return pre_vproc;
40be4c3ccbf407 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-11-29 =
 200  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 201  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 202  	freq_hz =3D freq_table[index].frequency * 1000;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 203  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 204  	opp =3D dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 205  	if (IS_ERR(opp)) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 206  		dev_err(cpu_dev, "cpu%d: failed to find OPP for %ld\n",
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 207  			policy->cpu, freq_hz);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 208  		return PTR_ERR(opp);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 209  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 210  	vproc =3D dev_pm_opp_get_voltage(opp);
8a31d9d94297b1 drivers/cpufreq/mt8173-cpufreq.c   Viresh Kumar  2017-01-23 =
 211  	dev_pm_opp_put(opp);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 212  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 213  	/*
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 214  	 * If the new voltage or the intermediate voltage is higher than the
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 215  	 * current voltage, scale up voltage first.
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 216  	 */
6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05 =
 217  	target_vproc =3D max(inter_vproc, vproc);
6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang 2022-05-05 =
 218  	if (pre_vproc <=3D target_vproc) {
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 219  		ret =3D mtk_cpufreq_set_voltage(info, target_vproc);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 220  		if (ret) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 221  			dev_err(cpu_dev,
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 222  				"cpu%d: failed to scale up voltage!\n", policy->cpu);
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 223  			mtk_cpufreq_set_voltage(info, pre_vproc);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 224  			goto out;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 225  		}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 226  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 227  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 228  	/* Reparent the CPU clock to intermediate clock. */
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 229  	ret =3D clk_set_parent(cpu_clk, info->inter_clk);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 230  	if (ret) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 231  		dev_err(cpu_dev,
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 232  			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 233  		mtk_cpufreq_set_voltage(info, pre_vproc);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 234  		goto out;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 235  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 236  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 237  	/* Set the original PLL to target rate. */
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 238  	ret =3D clk_set_rate(armpll, freq_hz);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 239  	if (ret) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 240  		dev_err(cpu_dev,
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 241  			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 242  		clk_set_parent(cpu_clk, armpll);
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 243  		mtk_cpufreq_set_voltage(info, pre_vproc);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 244  		goto out;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 245  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 246  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 247  	/* Set parent of CPU clock back to the original PLL. */
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 248  	ret =3D clk_set_parent(cpu_clk, armpll);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 249  	if (ret) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 250  		dev_err(cpu_dev,
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 251  			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 252  		mtk_cpufreq_set_voltage(info, inter_vproc);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 253  		goto out;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 254  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 255  =

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 256  	/*
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 257  	 * If the new voltage is lower than the intermediate voltage or the
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 258  	 * original voltage, scale down to the new voltage.
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 259  	 */
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 260  	if (vproc < inter_vproc || vproc < pre_vproc) {
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 261  		ret =3D mtk_cpufreq_set_voltage(info, vproc);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 262  		if (ret) {
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 263  			dev_err(cpu_dev,
9acc0f7a6edd8d drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 264  				"cpu%d: failed to scale down voltage!\n", policy->cpu);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 265  			clk_set_parent(cpu_clk, info->inter_clk);
4aef4aeaf1dd47 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-04-22 =
 266  			clk_set_rate(armpll, pre_freq_hz);
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 267  			clk_set_parent(cpu_clk, armpll);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 268  			goto out;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 269  		}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 270  	}
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 271  =

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 272  	info->current_freq =3D freq_hz;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 273  =

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 274  out:
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 275  	mutex_unlock(&info->reg_lock);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 276  =

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 =
 277  	return ret;
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 278  }
1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19 =
 279  =


:::::: The code at line 199 was first introduced by commit
:::::: 4aef4aeaf1dd47b2242ba78857b2773b7a5b5b05 cpufreq: mediatek: Replace =
old_* with pre_*

:::::: TO: Rex-BC Chen <rex-bc.chen@mediatek.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2038458489438483164==--

