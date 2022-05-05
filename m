Content-Type: multipart/mixed; boundary="===============8156875566048860498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing 2/5] drivers/devfreq/governor_passive.c:346 cpufreq_passive_register_notifier() warn: possible memory leak of 'parent_cpu_data'
Date: Fri, 06 May 2022 00:50:32 +0800
Message-ID: <202205060035.FycydyMZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8156875566048860498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Saravana Kannan <skannan@codeaurora.org>
CC: Chanwoo Choi <cw00.choi@samsung.com>
CC: Sibi Sankar <sibis@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing
head:   f8605f8ed725beedd71e89872e49178b930250d4
commit: 009cb1af01de85c190ffdb84b1944a17a624e493 [2/5] PM / devfreq: Add cp=
u based scaling support to passive governor
:::::: branch date: 22 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
506/202205060035.FycydyMZ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/devfreq/governor_passive.c:346 cpufreq_passive_register_notifier() =
warn: possible memory leak of 'parent_cpu_data'
drivers/devfreq/governor_passive.c:410 devfreq_passive_event_handler() warn=
: variable dereferenced before check 'p_data' (see line 407)

vim +/parent_cpu_data +346 drivers/devfreq/governor_passive.c

009cb1af01de85 Saravana Kannan 2021-03-02  269  =

009cb1af01de85 Saravana Kannan 2021-03-02  270  static int cpufreq_passive_=
register_notifier(struct devfreq *devfreq)
009cb1af01de85 Saravana Kannan 2021-03-02  271  {
009cb1af01de85 Saravana Kannan 2021-03-02  272  	struct devfreq_passive_dat=
a *p_data
009cb1af01de85 Saravana Kannan 2021-03-02  273  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
009cb1af01de85 Saravana Kannan 2021-03-02  274  	struct device *dev =3D dev=
freq->dev.parent;
009cb1af01de85 Saravana Kannan 2021-03-02  275  	struct opp_table *opp_tabl=
e =3D NULL;
009cb1af01de85 Saravana Kannan 2021-03-02  276  	struct devfreq_cpu_data *p=
arent_cpu_data;
009cb1af01de85 Saravana Kannan 2021-03-02  277  	struct cpufreq_policy *pol=
icy;
009cb1af01de85 Saravana Kannan 2021-03-02  278  	struct device *cpu_dev;
009cb1af01de85 Saravana Kannan 2021-03-02  279  	unsigned int cpu;
009cb1af01de85 Saravana Kannan 2021-03-02  280  	int ret;
009cb1af01de85 Saravana Kannan 2021-03-02  281  =

009cb1af01de85 Saravana Kannan 2021-03-02  282  	p_data->nb.notifier_call =
=3D cpufreq_passive_notifier_call;
009cb1af01de85 Saravana Kannan 2021-03-02  283  	ret =3D cpufreq_register_n=
otifier(&p_data->nb, CPUFREQ_TRANSITION_NOTIFIER);
009cb1af01de85 Saravana Kannan 2021-03-02  284  	if (ret) {
009cb1af01de85 Saravana Kannan 2021-03-02  285  		dev_err(dev, "failed to r=
egister cpufreq notifier\n");
009cb1af01de85 Saravana Kannan 2021-03-02  286  		p_data->nb.notifier_call =
=3D NULL;
009cb1af01de85 Saravana Kannan 2021-03-02  287  		goto err;
009cb1af01de85 Saravana Kannan 2021-03-02  288  	}
009cb1af01de85 Saravana Kannan 2021-03-02  289  =

009cb1af01de85 Saravana Kannan 2021-03-02  290  	for_each_possible_cpu(cpu)=
 {
009cb1af01de85 Saravana Kannan 2021-03-02  291  		if (p_data->parent_cpu_da=
ta[cpu])
009cb1af01de85 Saravana Kannan 2021-03-02  292  			continue;
009cb1af01de85 Saravana Kannan 2021-03-02  293  =

009cb1af01de85 Saravana Kannan 2021-03-02  294  		policy =3D cpufreq_cpu_ge=
t(cpu);
009cb1af01de85 Saravana Kannan 2021-03-02  295  		if (!policy) {
009cb1af01de85 Saravana Kannan 2021-03-02  296  			ret =3D -EPROBE_DEFER;
009cb1af01de85 Saravana Kannan 2021-03-02  297  			goto err;
009cb1af01de85 Saravana Kannan 2021-03-02  298  		}
009cb1af01de85 Saravana Kannan 2021-03-02  299  =

009cb1af01de85 Saravana Kannan 2021-03-02  300  		parent_cpu_data =3D kzall=
oc(sizeof(*parent_cpu_data),
009cb1af01de85 Saravana Kannan 2021-03-02  301  						GFP_KERNEL);
009cb1af01de85 Saravana Kannan 2021-03-02  302  		if (!parent_cpu_data) {
009cb1af01de85 Saravana Kannan 2021-03-02  303  			cpufreq_cpu_put(policy);
009cb1af01de85 Saravana Kannan 2021-03-02  304  			ret =3D -ENOMEM;
009cb1af01de85 Saravana Kannan 2021-03-02  305  			goto err;
009cb1af01de85 Saravana Kannan 2021-03-02  306  		}
009cb1af01de85 Saravana Kannan 2021-03-02  307  =

009cb1af01de85 Saravana Kannan 2021-03-02  308  		cpu_dev =3D get_cpu_devic=
e(cpu);
009cb1af01de85 Saravana Kannan 2021-03-02  309  		if (!cpu_dev) {
009cb1af01de85 Saravana Kannan 2021-03-02  310  			dev_err(dev, "failed to =
get cpu device\n");
009cb1af01de85 Saravana Kannan 2021-03-02  311  			cpufreq_cpu_put(policy);
009cb1af01de85 Saravana Kannan 2021-03-02  312  			ret =3D -ENODEV;
009cb1af01de85 Saravana Kannan 2021-03-02  313  			goto err;
009cb1af01de85 Saravana Kannan 2021-03-02  314  		}
009cb1af01de85 Saravana Kannan 2021-03-02  315  =

009cb1af01de85 Saravana Kannan 2021-03-02  316  		opp_table =3D dev_pm_opp_=
get_opp_table(cpu_dev);
009cb1af01de85 Saravana Kannan 2021-03-02  317  		if (IS_ERR(opp_table)) {
009cb1af01de85 Saravana Kannan 2021-03-02  318  			dev_err(dev, "failed to =
get opp_table of cpu%d\n", cpu);
009cb1af01de85 Saravana Kannan 2021-03-02  319  			cpufreq_cpu_put(policy);
009cb1af01de85 Saravana Kannan 2021-03-02  320  			ret =3D PTR_ERR(opp_tabl=
e);
009cb1af01de85 Saravana Kannan 2021-03-02  321  			goto err;
009cb1af01de85 Saravana Kannan 2021-03-02  322  		}
009cb1af01de85 Saravana Kannan 2021-03-02  323  =

009cb1af01de85 Saravana Kannan 2021-03-02  324  		parent_cpu_data->dev =3D =
cpu_dev;
009cb1af01de85 Saravana Kannan 2021-03-02  325  		parent_cpu_data->opp_tabl=
e =3D opp_table;
009cb1af01de85 Saravana Kannan 2021-03-02  326  		parent_cpu_data->first_cp=
u =3D cpumask_first(policy->related_cpus);
009cb1af01de85 Saravana Kannan 2021-03-02  327  		parent_cpu_data->cur_freq=
 =3D policy->cur;
009cb1af01de85 Saravana Kannan 2021-03-02  328  		parent_cpu_data->min_freq=
 =3D policy->cpuinfo.min_freq;
009cb1af01de85 Saravana Kannan 2021-03-02  329  		parent_cpu_data->max_freq=
 =3D policy->cpuinfo.max_freq;
009cb1af01de85 Saravana Kannan 2021-03-02  330  =

009cb1af01de85 Saravana Kannan 2021-03-02  331  		p_data->parent_cpu_data[c=
pu] =3D parent_cpu_data;
009cb1af01de85 Saravana Kannan 2021-03-02  332  		cpufreq_cpu_put(policy);
009cb1af01de85 Saravana Kannan 2021-03-02  333  	}
009cb1af01de85 Saravana Kannan 2021-03-02  334  =

009cb1af01de85 Saravana Kannan 2021-03-02  335  	mutex_lock(&devfreq->lock);
009cb1af01de85 Saravana Kannan 2021-03-02  336  	ret =3D devfreq_update_tar=
get(devfreq, 0L);
009cb1af01de85 Saravana Kannan 2021-03-02  337  	mutex_unlock(&devfreq->loc=
k);
009cb1af01de85 Saravana Kannan 2021-03-02  338  	if (ret)
009cb1af01de85 Saravana Kannan 2021-03-02  339  		dev_err(dev, "failed to u=
pdate the frequency\n");
009cb1af01de85 Saravana Kannan 2021-03-02  340  =

009cb1af01de85 Saravana Kannan 2021-03-02  341  	return ret;
009cb1af01de85 Saravana Kannan 2021-03-02  342  =

009cb1af01de85 Saravana Kannan 2021-03-02  343  err:
009cb1af01de85 Saravana Kannan 2021-03-02  344  	WARN_ON(cpufreq_passive_un=
register_notifier(devfreq));
009cb1af01de85 Saravana Kannan 2021-03-02  345  =

009cb1af01de85 Saravana Kannan 2021-03-02 @346  	return ret;
009cb1af01de85 Saravana Kannan 2021-03-02  347  }
009cb1af01de85 Saravana Kannan 2021-03-02  348  =

996133119f5733 Chanwoo Choi    2016-03-22  349  static int devfreq_passive_=
notifier_call(struct notifier_block *nb,
996133119f5733 Chanwoo Choi    2016-03-22  350  				unsigned long event, vo=
id *ptr)
996133119f5733 Chanwoo Choi    2016-03-22  351  {
996133119f5733 Chanwoo Choi    2016-03-22  352  	struct devfreq_passive_dat=
a *data
996133119f5733 Chanwoo Choi    2016-03-22  353  			=3D container_of(nb, str=
uct devfreq_passive_data, nb);
996133119f5733 Chanwoo Choi    2016-03-22  354  	struct devfreq *devfreq =
=3D (struct devfreq *)data->this;
996133119f5733 Chanwoo Choi    2016-03-22  355  	struct devfreq *parent =3D=
 (struct devfreq *)data->parent;
996133119f5733 Chanwoo Choi    2016-03-22  356  	struct devfreq_freqs *freq=
s =3D (struct devfreq_freqs *)ptr;
996133119f5733 Chanwoo Choi    2016-03-22  357  	unsigned long freq =3D fre=
qs->new;
b4365423bb7adf Chanwoo Choi    2020-10-07  358  	int ret =3D 0;
996133119f5733 Chanwoo Choi    2016-03-22  359  =

b4365423bb7adf Chanwoo Choi    2020-10-07  360  	mutex_lock_nested(&devfreq=
->lock, SINGLE_DEPTH_NESTING);
996133119f5733 Chanwoo Choi    2016-03-22  361  	switch (event) {
996133119f5733 Chanwoo Choi    2016-03-22  362  	case DEVFREQ_PRECHANGE:
996133119f5733 Chanwoo Choi    2016-03-22  363  		if (parent->previous_freq=
 > freq)
b4365423bb7adf Chanwoo Choi    2020-10-07  364  			ret =3D devfreq_update_t=
arget(devfreq, freq);
b4365423bb7adf Chanwoo Choi    2020-10-07  365  =

996133119f5733 Chanwoo Choi    2016-03-22  366  		break;
996133119f5733 Chanwoo Choi    2016-03-22  367  	case DEVFREQ_POSTCHANGE:
996133119f5733 Chanwoo Choi    2016-03-22  368  		if (parent->previous_freq=
 < freq)
b4365423bb7adf Chanwoo Choi    2020-10-07  369  			ret =3D devfreq_update_t=
arget(devfreq, freq);
996133119f5733 Chanwoo Choi    2016-03-22  370  		break;
996133119f5733 Chanwoo Choi    2016-03-22  371  	}
b4365423bb7adf Chanwoo Choi    2020-10-07  372  	mutex_unlock(&devfreq->loc=
k);
b4365423bb7adf Chanwoo Choi    2020-10-07  373  =

b4365423bb7adf Chanwoo Choi    2020-10-07  374  	if (ret < 0)
b4365423bb7adf Chanwoo Choi    2020-10-07  375  		dev_warn(&devfreq->dev,
b4365423bb7adf Chanwoo Choi    2020-10-07  376  			"failed to update devfre=
q using passive governor\n");
996133119f5733 Chanwoo Choi    2016-03-22  377  =

996133119f5733 Chanwoo Choi    2016-03-22  378  	return NOTIFY_DONE;
996133119f5733 Chanwoo Choi    2016-03-22  379  }
996133119f5733 Chanwoo Choi    2016-03-22  380  =

009cb1af01de85 Saravana Kannan 2021-03-02  381  static int devfreq_passive_=
unregister_notifier(struct devfreq *devfreq)
009cb1af01de85 Saravana Kannan 2021-03-02  382  {
009cb1af01de85 Saravana Kannan 2021-03-02  383  	struct devfreq_passive_dat=
a *p_data
009cb1af01de85 Saravana Kannan 2021-03-02  384  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
009cb1af01de85 Saravana Kannan 2021-03-02  385  	struct devfreq *parent =3D=
 (struct devfreq *)p_data->parent;
009cb1af01de85 Saravana Kannan 2021-03-02  386  	struct notifier_block *nb =
=3D &p_data->nb;
009cb1af01de85 Saravana Kannan 2021-03-02  387  =

009cb1af01de85 Saravana Kannan 2021-03-02  388  	return devfreq_unregister_=
notifier(parent, nb, DEVFREQ_TRANSITION_NOTIFIER);
009cb1af01de85 Saravana Kannan 2021-03-02  389  }
009cb1af01de85 Saravana Kannan 2021-03-02  390  =

009cb1af01de85 Saravana Kannan 2021-03-02  391  static int devfreq_passive_=
register_notifier(struct devfreq *devfreq)
009cb1af01de85 Saravana Kannan 2021-03-02  392  {
009cb1af01de85 Saravana Kannan 2021-03-02  393  	struct devfreq_passive_dat=
a *p_data
009cb1af01de85 Saravana Kannan 2021-03-02  394  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
009cb1af01de85 Saravana Kannan 2021-03-02  395  	struct devfreq *parent =3D=
 (struct devfreq *)p_data->parent;
009cb1af01de85 Saravana Kannan 2021-03-02  396  	struct notifier_block *nb =
=3D &p_data->nb;
009cb1af01de85 Saravana Kannan 2021-03-02  397  =

009cb1af01de85 Saravana Kannan 2021-03-02  398  	nb->notifier_call =3D devf=
req_passive_notifier_call;
009cb1af01de85 Saravana Kannan 2021-03-02  399  	return devfreq_register_no=
tifier(parent, nb, DEVFREQ_TRANSITION_NOTIFIER);
009cb1af01de85 Saravana Kannan 2021-03-02  400  }
009cb1af01de85 Saravana Kannan 2021-03-02  401  =

996133119f5733 Chanwoo Choi    2016-03-22  402  static int devfreq_passive_=
event_handler(struct devfreq *devfreq,
996133119f5733 Chanwoo Choi    2016-03-22  403  				unsigned int event, voi=
d *data)
996133119f5733 Chanwoo Choi    2016-03-22  404  {
996133119f5733 Chanwoo Choi    2016-03-22  405  	struct devfreq_passive_dat=
a *p_data
996133119f5733 Chanwoo Choi    2016-03-22  406  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
996133119f5733 Chanwoo Choi    2016-03-22 @407  	struct devfreq *parent =3D=
 (struct devfreq *)p_data->parent;
009cb1af01de85 Saravana Kannan 2021-03-02  408  	int ret =3D -EINVAL;
009cb1af01de85 Saravana Kannan 2021-03-02  409  =

009cb1af01de85 Saravana Kannan 2021-03-02 @410  	if (!p_data)
009cb1af01de85 Saravana Kannan 2021-03-02  411  		return -EINVAL;
996133119f5733 Chanwoo Choi    2016-03-22  412  =

009cb1af01de85 Saravana Kannan 2021-03-02  413  	if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV && !parent)
996133119f5733 Chanwoo Choi    2016-03-22  414  		return -EPROBE_DEFER;
996133119f5733 Chanwoo Choi    2016-03-22  415  =

996133119f5733 Chanwoo Choi    2016-03-22  416  	switch (event) {
996133119f5733 Chanwoo Choi    2016-03-22  417  	case DEVFREQ_GOV_START:
996133119f5733 Chanwoo Choi    2016-03-22  418  		if (!p_data->this)
996133119f5733 Chanwoo Choi    2016-03-22  419  			p_data->this =3D devfreq;
996133119f5733 Chanwoo Choi    2016-03-22  420  =

009cb1af01de85 Saravana Kannan 2021-03-02  421  		if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV)
009cb1af01de85 Saravana Kannan 2021-03-02  422  			ret =3D devfreq_passive_=
register_notifier(devfreq);
009cb1af01de85 Saravana Kannan 2021-03-02  423  		else if (p_data->parent_t=
ype =3D=3D CPUFREQ_PARENT_DEV)
009cb1af01de85 Saravana Kannan 2021-03-02  424  			ret =3D cpufreq_passive_=
register_notifier(devfreq);
996133119f5733 Chanwoo Choi    2016-03-22  425  		break;
996133119f5733 Chanwoo Choi    2016-03-22  426  	case DEVFREQ_GOV_STOP:
009cb1af01de85 Saravana Kannan 2021-03-02  427  		if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV)
009cb1af01de85 Saravana Kannan 2021-03-02  428  			WARN_ON(devfreq_passive_=
unregister_notifier(devfreq));
009cb1af01de85 Saravana Kannan 2021-03-02  429  		else if (p_data->parent_t=
ype =3D=3D CPUFREQ_PARENT_DEV)
009cb1af01de85 Saravana Kannan 2021-03-02  430  			WARN_ON(cpufreq_passive_=
unregister_notifier(devfreq));
996133119f5733 Chanwoo Choi    2016-03-22  431  		break;
996133119f5733 Chanwoo Choi    2016-03-22  432  	default:
996133119f5733 Chanwoo Choi    2016-03-22  433  		break;
996133119f5733 Chanwoo Choi    2016-03-22  434  	}
996133119f5733 Chanwoo Choi    2016-03-22  435  =

996133119f5733 Chanwoo Choi    2016-03-22  436  	return ret;
996133119f5733 Chanwoo Choi    2016-03-22  437  }
996133119f5733 Chanwoo Choi    2016-03-22  438  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8156875566048860498==--

