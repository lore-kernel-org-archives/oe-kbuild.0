Content-Type: multipart/mixed; boundary="===============3133630207251845853=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing-passive-gov 3/3] drivers/devfreq/governor_passive.c:247:23: warning: Either the condition '!freqs' is redundant or there is possible null pointer dereference: freqs.
Date: Mon, 01 Mar 2021 18:27:36 +0800
Message-ID: <202103011824.rWAJCiTO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3133630207251845853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Saravana Kannan <skannan@codeaurora.org>
CC: Chanwoo Choi <cw00.choi@samsung.com>
CC: Sibi Sankar <sibis@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing-passive-gov
head:   82d4ff586ae2fb6d89cad871949004bed3438ccb
commit: 82d4ff586ae2fb6d89cad871949004bed3438ccb [3/3] PM / devfreq: Add cp=
u based scaling support to passive governor
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/devfreq/governor_passive.c:247:23: warning: Either the condition=
 '!freqs' is redundant or there is possible null pointer dereference: freqs=
. [nullPointerRedundantCheck]
    unsigned long freq =3D freqs->new;
                         ^
   drivers/devfreq/governor_passive.c:251:37: note: Assuming that condition=
 '!freqs' is not redundant
    if (event !=3D CPUFREQ_POSTCHANGE || !freqs ||
                                       ^
   drivers/devfreq/governor_passive.c:247:23: note: Null pointer dereference
    unsigned long freq =3D freqs->new;
                         ^
>> drivers/devfreq/governor_passive.c:403:3: warning: Statements following =
return, break, continue, goto or throw will never be executed. [unreachable=
Code]
     if (p_data->parent_type =3D=3D DEVFREQ_PARENT_DEV)
     ^

vim +247 drivers/devfreq/governor_passive.c

996133119f5733 Chanwoo Choi    2016-03-22  238  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  239  static int cpufreq_passive_=
notifier_call(struct notifier_block *nb,
82d4ff586ae2fb Saravana Kannan 2021-03-01  240  					 unsigned long event, =
void *ptr)
82d4ff586ae2fb Saravana Kannan 2021-03-01  241  {
82d4ff586ae2fb Saravana Kannan 2021-03-01  242  	struct devfreq_passive_dat=
a *data =3D
82d4ff586ae2fb Saravana Kannan 2021-03-01  243  			container_of(nb, struct =
devfreq_passive_data, nb);
82d4ff586ae2fb Saravana Kannan 2021-03-01  244  	struct devfreq *devfreq =
=3D (struct devfreq *)data->this;
82d4ff586ae2fb Saravana Kannan 2021-03-01  245  	struct devfreq_cpu_state *=
cpu_state;
82d4ff586ae2fb Saravana Kannan 2021-03-01  246  	struct cpufreq_freqs *freq=
s =3D ptr;
82d4ff586ae2fb Saravana Kannan 2021-03-01 @247  	unsigned long freq =3D fre=
qs->new;
82d4ff586ae2fb Saravana Kannan 2021-03-01  248  	unsigned int cur_freq;
82d4ff586ae2fb Saravana Kannan 2021-03-01  249  	int ret;
82d4ff586ae2fb Saravana Kannan 2021-03-01  250  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  251  	if (event !=3D CPUFREQ_POS=
TCHANGE || !freqs ||
82d4ff586ae2fb Saravana Kannan 2021-03-01  252  		!data->cpu_state[freqs->p=
olicy->cpu])
82d4ff586ae2fb Saravana Kannan 2021-03-01  253  		return 0;
82d4ff586ae2fb Saravana Kannan 2021-03-01  254  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  255  	cpu_state =3D data->cpu_st=
ate[freqs->policy->cpu];
82d4ff586ae2fb Saravana Kannan 2021-03-01  256  	if (cpu_state->freq =3D=3D=
 freqs->new)
82d4ff586ae2fb Saravana Kannan 2021-03-01  257  		return 0;
82d4ff586ae2fb Saravana Kannan 2021-03-01  258  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  259  	/* Backup current freq and=
 pre-update cpu state freq*/
82d4ff586ae2fb Saravana Kannan 2021-03-01  260  	cur_freq =3D cpu_state->fr=
eq;
82d4ff586ae2fb Saravana Kannan 2021-03-01  261  	cpu_state->freq =3D freqs-=
>new;
82d4ff586ae2fb Saravana Kannan 2021-03-01  262  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  263  	mutex_lock(&devfreq->lock);
82d4ff586ae2fb Saravana Kannan 2021-03-01  264  	ret =3D devfreq_update_tar=
get(devfreq, freq);
82d4ff586ae2fb Saravana Kannan 2021-03-01  265  	mutex_unlock(&devfreq->loc=
k);
82d4ff586ae2fb Saravana Kannan 2021-03-01  266  	if (ret) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  267  		cpu_state->freq =3D cur_f=
req;
82d4ff586ae2fb Saravana Kannan 2021-03-01  268  		dev_err(&devfreq->dev, "C=
ouldn't update the frequency.\n");
82d4ff586ae2fb Saravana Kannan 2021-03-01  269  		return ret;
82d4ff586ae2fb Saravana Kannan 2021-03-01  270  	}
82d4ff586ae2fb Saravana Kannan 2021-03-01  271  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  272  	return 0;
82d4ff586ae2fb Saravana Kannan 2021-03-01  273  }
82d4ff586ae2fb Saravana Kannan 2021-03-01  274  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  275  static int cpufreq_passive_=
register(struct devfreq_passive_data **p_data)
82d4ff586ae2fb Saravana Kannan 2021-03-01  276  {
82d4ff586ae2fb Saravana Kannan 2021-03-01  277  	struct devfreq_passive_dat=
a *data =3D *p_data;
82d4ff586ae2fb Saravana Kannan 2021-03-01  278  	struct devfreq *devfreq =
=3D (struct devfreq *)data->this;
82d4ff586ae2fb Saravana Kannan 2021-03-01  279  	struct device *dev =3D dev=
freq->dev.parent;
82d4ff586ae2fb Saravana Kannan 2021-03-01  280  	struct opp_table *opp_tabl=
e =3D NULL;
82d4ff586ae2fb Saravana Kannan 2021-03-01  281  	struct devfreq_cpu_state *=
state;
82d4ff586ae2fb Saravana Kannan 2021-03-01  282  	struct cpufreq_policy *pol=
icy;
82d4ff586ae2fb Saravana Kannan 2021-03-01  283  	struct device *cpu_dev;
82d4ff586ae2fb Saravana Kannan 2021-03-01  284  	unsigned int cpu;
82d4ff586ae2fb Saravana Kannan 2021-03-01  285  	int ret;
82d4ff586ae2fb Saravana Kannan 2021-03-01  286  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  287  	get_online_cpus();
82d4ff586ae2fb Saravana Kannan 2021-03-01  288  	data->nb.notifier_call =3D=
 cpufreq_passive_notifier_call;
82d4ff586ae2fb Saravana Kannan 2021-03-01  289  	ret =3D cpufreq_register_n=
otifier(&data->nb,
82d4ff586ae2fb Saravana Kannan 2021-03-01  290  					CPUFREQ_TRANSITION_NOT=
IFIER);
82d4ff586ae2fb Saravana Kannan 2021-03-01  291  	if (ret) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  292  		dev_err(dev, "Couldn't re=
gister cpufreq notifier.\n");
82d4ff586ae2fb Saravana Kannan 2021-03-01  293  		data->nb.notifier_call =
=3D NULL;
82d4ff586ae2fb Saravana Kannan 2021-03-01  294  		goto out;
82d4ff586ae2fb Saravana Kannan 2021-03-01  295  	}
82d4ff586ae2fb Saravana Kannan 2021-03-01  296  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  297  	/* Populate devfreq_cpu_st=
ate */
82d4ff586ae2fb Saravana Kannan 2021-03-01  298  	for_each_online_cpu(cpu) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  299  		if (data->cpu_state[cpu])
82d4ff586ae2fb Saravana Kannan 2021-03-01  300  			continue;
82d4ff586ae2fb Saravana Kannan 2021-03-01  301  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  302  		policy =3D cpufreq_cpu_ge=
t(cpu);
82d4ff586ae2fb Saravana Kannan 2021-03-01  303  		if (policy) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  304  			state =3D kzalloc(sizeof=
(*state), GFP_KERNEL);
82d4ff586ae2fb Saravana Kannan 2021-03-01  305  			if (!state) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  306  				ret =3D -ENOMEM;
82d4ff586ae2fb Saravana Kannan 2021-03-01  307  				goto out;
82d4ff586ae2fb Saravana Kannan 2021-03-01  308  			}
82d4ff586ae2fb Saravana Kannan 2021-03-01  309  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  310  			cpu_dev =3D get_cpu_devi=
ce(cpu);
82d4ff586ae2fb Saravana Kannan 2021-03-01  311  			if (!cpu_dev) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  312  				dev_err(dev, "Couldn't =
get cpu device.\n");
82d4ff586ae2fb Saravana Kannan 2021-03-01  313  				ret =3D -ENODEV;
82d4ff586ae2fb Saravana Kannan 2021-03-01  314  				goto out;
82d4ff586ae2fb Saravana Kannan 2021-03-01  315  			}
82d4ff586ae2fb Saravana Kannan 2021-03-01  316  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  317  			opp_table =3D dev_pm_opp=
_get_opp_table(cpu_dev);
82d4ff586ae2fb Saravana Kannan 2021-03-01  318  			if (IS_ERR(devfreq->opp_=
table)) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  319  				ret =3D PTR_ERR(opp_tab=
le);
82d4ff586ae2fb Saravana Kannan 2021-03-01  320  				goto out;
82d4ff586ae2fb Saravana Kannan 2021-03-01  321  			}
82d4ff586ae2fb Saravana Kannan 2021-03-01  322  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  323  			state->dev =3D cpu_dev;
82d4ff586ae2fb Saravana Kannan 2021-03-01  324  			state->opp_table =3D opp=
_table;
82d4ff586ae2fb Saravana Kannan 2021-03-01  325  			state->first_cpu =3D cpu=
mask_first(policy->related_cpus);
82d4ff586ae2fb Saravana Kannan 2021-03-01  326  			state->freq =3D policy->=
cur;
82d4ff586ae2fb Saravana Kannan 2021-03-01  327  			state->min_freq =3D poli=
cy->cpuinfo.min_freq;
82d4ff586ae2fb Saravana Kannan 2021-03-01  328  			state->max_freq =3D poli=
cy->cpuinfo.max_freq;
82d4ff586ae2fb Saravana Kannan 2021-03-01  329  			data->cpu_state[cpu] =3D=
 state;
82d4ff586ae2fb Saravana Kannan 2021-03-01  330  			cpufreq_cpu_put(policy);
82d4ff586ae2fb Saravana Kannan 2021-03-01  331  		} else {
82d4ff586ae2fb Saravana Kannan 2021-03-01  332  			ret =3D -EPROBE_DEFER;
82d4ff586ae2fb Saravana Kannan 2021-03-01  333  			goto out;
82d4ff586ae2fb Saravana Kannan 2021-03-01  334  		}
82d4ff586ae2fb Saravana Kannan 2021-03-01  335  	}
82d4ff586ae2fb Saravana Kannan 2021-03-01  336  out:
82d4ff586ae2fb Saravana Kannan 2021-03-01  337  	put_online_cpus();
82d4ff586ae2fb Saravana Kannan 2021-03-01  338  	if (ret)
82d4ff586ae2fb Saravana Kannan 2021-03-01  339  		return ret;
82d4ff586ae2fb Saravana Kannan 2021-03-01  340  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  341  	/* Update devfreq */
82d4ff586ae2fb Saravana Kannan 2021-03-01  342  	mutex_lock(&devfreq->lock);
82d4ff586ae2fb Saravana Kannan 2021-03-01  343  	ret =3D update_devfreq(dev=
freq);
82d4ff586ae2fb Saravana Kannan 2021-03-01  344  	mutex_unlock(&devfreq->loc=
k);
82d4ff586ae2fb Saravana Kannan 2021-03-01  345  	if (ret)
82d4ff586ae2fb Saravana Kannan 2021-03-01  346  		dev_err(dev, "Couldn't up=
date the frequency.\n");
82d4ff586ae2fb Saravana Kannan 2021-03-01  347  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  348  	return ret;
82d4ff586ae2fb Saravana Kannan 2021-03-01  349  }
82d4ff586ae2fb Saravana Kannan 2021-03-01  350  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  351  static int cpufreq_passive_=
unregister(struct devfreq_passive_data **p_data)
82d4ff586ae2fb Saravana Kannan 2021-03-01  352  {
82d4ff586ae2fb Saravana Kannan 2021-03-01  353  	struct devfreq_passive_dat=
a *data =3D *p_data;
82d4ff586ae2fb Saravana Kannan 2021-03-01  354  	struct devfreq_cpu_state *=
cpu_state;
82d4ff586ae2fb Saravana Kannan 2021-03-01  355  	int cpu;
82d4ff586ae2fb Saravana Kannan 2021-03-01  356  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  357  	if (data->nb.notifier_call)
82d4ff586ae2fb Saravana Kannan 2021-03-01  358  		cpufreq_unregister_notifi=
er(&data->nb,
82d4ff586ae2fb Saravana Kannan 2021-03-01  359  					    CPUFREQ_TRANSITION=
_NOTIFIER);
82d4ff586ae2fb Saravana Kannan 2021-03-01  360  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  361  	for_each_possible_cpu(cpu)=
 {
82d4ff586ae2fb Saravana Kannan 2021-03-01  362  		cpu_state =3D data->cpu_s=
tate[cpu];
82d4ff586ae2fb Saravana Kannan 2021-03-01  363  		if (cpu_state) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  364  			if (cpu_state->opp_table)
82d4ff586ae2fb Saravana Kannan 2021-03-01  365  				dev_pm_opp_put_opp_tabl=
e(cpu_state->opp_table);
82d4ff586ae2fb Saravana Kannan 2021-03-01  366  			kfree(cpu_state);
82d4ff586ae2fb Saravana Kannan 2021-03-01  367  			cpu_state =3D NULL;
82d4ff586ae2fb Saravana Kannan 2021-03-01  368  		}
82d4ff586ae2fb Saravana Kannan 2021-03-01  369  	}
82d4ff586ae2fb Saravana Kannan 2021-03-01  370  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  371  	return 0;
82d4ff586ae2fb Saravana Kannan 2021-03-01  372  }
82d4ff586ae2fb Saravana Kannan 2021-03-01  373  =

996133119f5733 Chanwoo Choi    2016-03-22  374  static int devfreq_passive_=
event_handler(struct devfreq *devfreq,
996133119f5733 Chanwoo Choi    2016-03-22  375  				unsigned int event, voi=
d *data)
996133119f5733 Chanwoo Choi    2016-03-22  376  {
996133119f5733 Chanwoo Choi    2016-03-22  377  	struct devfreq_passive_dat=
a *p_data
996133119f5733 Chanwoo Choi    2016-03-22  378  			=3D (struct devfreq_pass=
ive_data *)devfreq->data;
996133119f5733 Chanwoo Choi    2016-03-22  379  	struct devfreq *parent =3D=
 (struct devfreq *)p_data->parent;
996133119f5733 Chanwoo Choi    2016-03-22  380  	struct notifier_block *nb =
=3D &p_data->nb;
996133119f5733 Chanwoo Choi    2016-03-22  381  	int ret =3D 0;
996133119f5733 Chanwoo Choi    2016-03-22  382  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  383  	if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV && !parent)
996133119f5733 Chanwoo Choi    2016-03-22  384  		return -EPROBE_DEFER;
996133119f5733 Chanwoo Choi    2016-03-22  385  =

996133119f5733 Chanwoo Choi    2016-03-22  386  	switch (event) {
996133119f5733 Chanwoo Choi    2016-03-22  387  	case DEVFREQ_GOV_START:
996133119f5733 Chanwoo Choi    2016-03-22  388  		if (!p_data->this)
996133119f5733 Chanwoo Choi    2016-03-22  389  			p_data->this =3D devfreq;
996133119f5733 Chanwoo Choi    2016-03-22  390  =

82d4ff586ae2fb Saravana Kannan 2021-03-01  391  		if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV) {
996133119f5733 Chanwoo Choi    2016-03-22  392  			nb->notifier_call =3D de=
vfreq_passive_notifier_call;
0ef7c7cce43f6e Leonard Crestez 2019-08-08  393  			ret =3D devfreq_register=
_notifier(parent, nb,
996133119f5733 Chanwoo Choi    2016-03-22  394  						DEVFREQ_TRANSITION_NO=
TIFIER);
82d4ff586ae2fb Saravana Kannan 2021-03-01  395  		} else if (p_data->parent=
_type =3D=3D CPUFREQ_PARENT_DEV) {
82d4ff586ae2fb Saravana Kannan 2021-03-01  396  			ret =3D cpufreq_passive_=
register(&p_data);
82d4ff586ae2fb Saravana Kannan 2021-03-01  397  		} else {
82d4ff586ae2fb Saravana Kannan 2021-03-01  398  			ret =3D -EINVAL;
82d4ff586ae2fb Saravana Kannan 2021-03-01  399  		}
996133119f5733 Chanwoo Choi    2016-03-22  400  		break;
996133119f5733 Chanwoo Choi    2016-03-22  401  	case DEVFREQ_GOV_STOP:
82d4ff586ae2fb Saravana Kannan 2021-03-01  402  		break;
82d4ff586ae2fb Saravana Kannan 2021-03-01 @403  		if (p_data->parent_type =
=3D=3D DEVFREQ_PARENT_DEV)
0ef7c7cce43f6e Leonard Crestez 2019-08-08  404  			WARN_ON(devfreq_unregist=
er_notifier(parent, nb,
0ef7c7cce43f6e Leonard Crestez 2019-08-08  405  						DEVFREQ_TRANSITION_NO=
TIFIER));
82d4ff586ae2fb Saravana Kannan 2021-03-01  406  		else if (p_data->parent_t=
ype =3D=3D CPUFREQ_PARENT_DEV)
82d4ff586ae2fb Saravana Kannan 2021-03-01  407  			WARN_ON(cpufreq_passive_=
unregister(&p_data));
82d4ff586ae2fb Saravana Kannan 2021-03-01  408  		else
82d4ff586ae2fb Saravana Kannan 2021-03-01  409  			ret =3D -EINVAL;
996133119f5733 Chanwoo Choi    2016-03-22  410   		break;
996133119f5733 Chanwoo Choi    2016-03-22  411  	default:
996133119f5733 Chanwoo Choi    2016-03-22  412  		break;
996133119f5733 Chanwoo Choi    2016-03-22  413  	}
996133119f5733 Chanwoo Choi    2016-03-22  414  =

996133119f5733 Chanwoo Choi    2016-03-22  415  	return ret;
996133119f5733 Chanwoo Choi    2016-03-22  416  }
996133119f5733 Chanwoo Choi    2016-03-22  417  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3133630207251845853==--

