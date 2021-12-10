Content-Type: multipart/mixed; boundary="===============3653147844377283653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing 2/4] drivers/devfreq/governor_passive.c:346 cpufreq_passive_register_notifier() warn: possible memory leak of 'parent_cpu_data'
Date: Sat, 11 Dec 2021 02:23:45 +0800
Message-ID: <202112110259.0FocPe7i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3653147844377283653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Saravana Kannan <skannan@codeaurora.org>
CC: Chanwoo Choi <cw00.choi@samsung.com>
CC: Sibi Sankar <sibis@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing
head:   5857e3d1820d85e10321ec180ed88e780fd0ec3e
commit: d678890dcdf858c25d2789793a35a81c4311e972 [2/4] PM / devfreq: Add cp=
u based scaling support to passive governor
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110259.0FocPe7i-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/devfreq/governor_passive.c:346 cpufreq_passive_register_notifier() =
warn: possible memory leak of 'parent_cpu_data'

vim +/parent_cpu_data +346 drivers/devfreq/governor_passive.c

d678890dcdf858 Saravana Kannan 2021-03-02  269  =

d678890dcdf858 Saravana Kannan 2021-03-02  270  static int cpufreq_passive_=
register_notifier(struct devfreq *devfreq)
d678890dcdf858 Saravana Kannan 2021-03-02  271  {
d678890dcdf858 Saravana Kannan 2021-03-02  272  	struct devfreq_passive_dat=
a *p_data
d678890dcdf858 Saravana Kannan 2021-03-02  273  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
d678890dcdf858 Saravana Kannan 2021-03-02  274  	struct device *dev =3D dev=
freq->dev.parent;
d678890dcdf858 Saravana Kannan 2021-03-02  275  	struct opp_table *opp_tabl=
e =3D NULL;
d678890dcdf858 Saravana Kannan 2021-03-02  276  	struct devfreq_cpu_data *p=
arent_cpu_data;
d678890dcdf858 Saravana Kannan 2021-03-02  277  	struct cpufreq_policy *pol=
icy;
d678890dcdf858 Saravana Kannan 2021-03-02  278  	struct device *cpu_dev;
d678890dcdf858 Saravana Kannan 2021-03-02  279  	unsigned int cpu;
d678890dcdf858 Saravana Kannan 2021-03-02  280  	int ret;
d678890dcdf858 Saravana Kannan 2021-03-02  281  =

d678890dcdf858 Saravana Kannan 2021-03-02  282  	p_data->nb.notifier_call =
=3D cpufreq_passive_notifier_call;
d678890dcdf858 Saravana Kannan 2021-03-02  283  	ret =3D cpufreq_register_n=
otifier(&p_data->nb, CPUFREQ_TRANSITION_NOTIFIER);
d678890dcdf858 Saravana Kannan 2021-03-02  284  	if (ret) {
d678890dcdf858 Saravana Kannan 2021-03-02  285  		dev_err(dev, "failed to r=
egister cpufreq notifier\n");
d678890dcdf858 Saravana Kannan 2021-03-02  286  		p_data->nb.notifier_call =
=3D NULL;
d678890dcdf858 Saravana Kannan 2021-03-02  287  		goto err;
d678890dcdf858 Saravana Kannan 2021-03-02  288  	}
d678890dcdf858 Saravana Kannan 2021-03-02  289  =

d678890dcdf858 Saravana Kannan 2021-03-02  290  	for_each_possible_cpu(cpu)=
 {
d678890dcdf858 Saravana Kannan 2021-03-02  291  		if (p_data->cpu_data[cpu])
d678890dcdf858 Saravana Kannan 2021-03-02  292  			continue;
d678890dcdf858 Saravana Kannan 2021-03-02  293  =

d678890dcdf858 Saravana Kannan 2021-03-02  294  		policy =3D cpufreq_cpu_ge=
t(cpu);
d678890dcdf858 Saravana Kannan 2021-03-02  295  		if (!policy) {
d678890dcdf858 Saravana Kannan 2021-03-02  296  			ret =3D -EPROBE_DEFER;
d678890dcdf858 Saravana Kannan 2021-03-02  297  			goto err;
d678890dcdf858 Saravana Kannan 2021-03-02  298  		}
d678890dcdf858 Saravana Kannan 2021-03-02  299  =

d678890dcdf858 Saravana Kannan 2021-03-02  300  		parent_cpu_data =3D kzall=
oc(sizeof(*parent_cpu_data),
d678890dcdf858 Saravana Kannan 2021-03-02  301  						GFP_KERNEL);
d678890dcdf858 Saravana Kannan 2021-03-02  302  		if (!parent_cpu_data) {
d678890dcdf858 Saravana Kannan 2021-03-02  303  			cpufreq_cpu_put(policy);
d678890dcdf858 Saravana Kannan 2021-03-02  304  			ret =3D -ENOMEM;
d678890dcdf858 Saravana Kannan 2021-03-02  305  			goto err;
d678890dcdf858 Saravana Kannan 2021-03-02  306  		}
d678890dcdf858 Saravana Kannan 2021-03-02  307  =

d678890dcdf858 Saravana Kannan 2021-03-02  308  		cpu_dev =3D get_cpu_devic=
e(cpu);
d678890dcdf858 Saravana Kannan 2021-03-02  309  		if (!cpu_dev) {
d678890dcdf858 Saravana Kannan 2021-03-02  310  			dev_err(dev, "failed to =
get cpu device\n");
d678890dcdf858 Saravana Kannan 2021-03-02  311  			cpufreq_cpu_put(policy);
d678890dcdf858 Saravana Kannan 2021-03-02  312  			ret =3D -ENODEV;
d678890dcdf858 Saravana Kannan 2021-03-02  313  			goto err;
d678890dcdf858 Saravana Kannan 2021-03-02  314  		}
d678890dcdf858 Saravana Kannan 2021-03-02  315  =

d678890dcdf858 Saravana Kannan 2021-03-02  316  		opp_table =3D dev_pm_opp_=
get_opp_table(cpu_dev);
d678890dcdf858 Saravana Kannan 2021-03-02  317  		if (IS_ERR(opp_table)) {
d678890dcdf858 Saravana Kannan 2021-03-02  318  			dev_err(dev, "failed to =
get opp_table of cpu%d\n", cpu);
d678890dcdf858 Saravana Kannan 2021-03-02  319  			cpufreq_cpu_put(policy);
d678890dcdf858 Saravana Kannan 2021-03-02  320  			ret =3D PTR_ERR(opp_tabl=
e);
d678890dcdf858 Saravana Kannan 2021-03-02  321  			goto err;
d678890dcdf858 Saravana Kannan 2021-03-02  322  		}
d678890dcdf858 Saravana Kannan 2021-03-02  323  =

d678890dcdf858 Saravana Kannan 2021-03-02  324  		parent_cpu_data->dev =3D =
cpu_dev;
d678890dcdf858 Saravana Kannan 2021-03-02  325  		parent_cpu_data->opp_tabl=
e =3D opp_table;
d678890dcdf858 Saravana Kannan 2021-03-02  326  		parent_cpu_data->first_cp=
u =3D cpumask_first(policy->related_cpus);
d678890dcdf858 Saravana Kannan 2021-03-02  327  		parent_cpu_data->cur_freq=
 =3D policy->cur;
d678890dcdf858 Saravana Kannan 2021-03-02  328  		parent_cpu_data->min_freq=
 =3D policy->cpuinfo.min_freq;
d678890dcdf858 Saravana Kannan 2021-03-02  329  		parent_cpu_data->max_freq=
 =3D policy->cpuinfo.max_freq;
d678890dcdf858 Saravana Kannan 2021-03-02  330  =

d678890dcdf858 Saravana Kannan 2021-03-02  331  		p_data->cpu_data[cpu] =3D=
 parent_cpu_data;
d678890dcdf858 Saravana Kannan 2021-03-02  332  		cpufreq_cpu_put(policy);
d678890dcdf858 Saravana Kannan 2021-03-02  333  	}
d678890dcdf858 Saravana Kannan 2021-03-02  334  =

d678890dcdf858 Saravana Kannan 2021-03-02  335  	mutex_lock(&devfreq->lock);
d678890dcdf858 Saravana Kannan 2021-03-02  336  	ret =3D devfreq_update_tar=
get(devfreq, 0L);
d678890dcdf858 Saravana Kannan 2021-03-02  337  	mutex_unlock(&devfreq->loc=
k);
d678890dcdf858 Saravana Kannan 2021-03-02  338  	if (ret)
d678890dcdf858 Saravana Kannan 2021-03-02  339  		dev_err(dev, "failed to u=
pdate the frequency\n");
d678890dcdf858 Saravana Kannan 2021-03-02  340  =

d678890dcdf858 Saravana Kannan 2021-03-02  341  	return ret;
d678890dcdf858 Saravana Kannan 2021-03-02  342  =

d678890dcdf858 Saravana Kannan 2021-03-02  343  err:
d678890dcdf858 Saravana Kannan 2021-03-02  344  	WARN_ON(cpufreq_passive_un=
register_notifier(devfreq));
d678890dcdf858 Saravana Kannan 2021-03-02  345  =

d678890dcdf858 Saravana Kannan 2021-03-02 @346  	return ret;
d678890dcdf858 Saravana Kannan 2021-03-02  347  }
d678890dcdf858 Saravana Kannan 2021-03-02  348  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3653147844377283653==--

