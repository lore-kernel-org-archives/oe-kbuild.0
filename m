Content-Type: multipart/mixed; boundary="===============8443750608891634412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing 5/5] drivers/devfreq/governor_passive.c:190 cpufreq_passive_notifier_call() warn: variable dereferenced before check 'freqs' (see line 188)
Date: Fri, 06 May 2022 03:45:51 +0800
Message-ID: <202205060340.kwfOSVud-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8443750608891634412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chanwoo Choi <cw00.choi@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing
head:   f8605f8ed725beedd71e89872e49178b930250d4
commit: f8605f8ed725beedd71e89872e49178b930250d4 [5/5] PM / devfreq: Use cp=
ufreq_policy instead of NR_CPU
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
506/202205060340.kwfOSVud-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/devfreq/governor_passive.c:190 cpufreq_passive_notifier_call() warn=
: variable dereferenced before check 'freqs' (see line 188)

Old smatch warnings:
drivers/devfreq/governor_passive.c:315 cpufreq_passive_register_notifier() =
warn: possible memory leak of 'parent_cpu_data'
drivers/devfreq/governor_passive.c:379 devfreq_passive_event_handler() warn=
: variable dereferenced before check 'p_data' (see line 376)

vim +/freqs +190 drivers/devfreq/governor_passive.c

009cb1af01de85 Saravana Kannan 2021-03-02  176  =

009cb1af01de85 Saravana Kannan 2021-03-02  177  static int cpufreq_passive_=
notifier_call(struct notifier_block *nb,
009cb1af01de85 Saravana Kannan 2021-03-02  178  					 unsigned long event, =
void *ptr)
009cb1af01de85 Saravana Kannan 2021-03-02  179  {
f8605f8ed725be Chanwoo Choi    2022-04-27  180  	struct devfreq_passive_dat=
a *p_data =3D
009cb1af01de85 Saravana Kannan 2021-03-02  181  			container_of(nb, struct =
devfreq_passive_data, nb);
f8605f8ed725be Chanwoo Choi    2022-04-27  182  	struct devfreq *devfreq =
=3D (struct devfreq *)p_data->this;
009cb1af01de85 Saravana Kannan 2021-03-02  183  	struct devfreq_cpu_data *p=
arent_cpu_data;
009cb1af01de85 Saravana Kannan 2021-03-02  184  	struct cpufreq_freqs *freq=
s =3D ptr;
009cb1af01de85 Saravana Kannan 2021-03-02  185  	unsigned int cur_freq;
009cb1af01de85 Saravana Kannan 2021-03-02  186  	int ret;
009cb1af01de85 Saravana Kannan 2021-03-02  187  =

f8605f8ed725be Chanwoo Choi    2022-04-27 @188  	parent_cpu_data =3D get_pa=
rent_cpu_data(p_data, freqs->policy->cpu);
f8605f8ed725be Chanwoo Choi    2022-04-27  189  =

f8605f8ed725be Chanwoo Choi    2022-04-27 @190  	if (event !=3D CPUFREQ_POS=
TCHANGE || !freqs || !parent_cpu_data)
009cb1af01de85 Saravana Kannan 2021-03-02  191  		return 0;
009cb1af01de85 Saravana Kannan 2021-03-02  192  =

009cb1af01de85 Saravana Kannan 2021-03-02  193  	if (parent_cpu_data->cur_f=
req =3D=3D freqs->new)
009cb1af01de85 Saravana Kannan 2021-03-02  194  		return 0;
009cb1af01de85 Saravana Kannan 2021-03-02  195  =

009cb1af01de85 Saravana Kannan 2021-03-02  196  	cur_freq =3D parent_cpu_da=
ta->cur_freq;
009cb1af01de85 Saravana Kannan 2021-03-02  197  	parent_cpu_data->cur_freq =
=3D freqs->new;
009cb1af01de85 Saravana Kannan 2021-03-02  198  =

009cb1af01de85 Saravana Kannan 2021-03-02  199  	mutex_lock(&devfreq->lock);
009cb1af01de85 Saravana Kannan 2021-03-02  200  	ret =3D devfreq_update_tar=
get(devfreq, freqs->new);
009cb1af01de85 Saravana Kannan 2021-03-02  201  	mutex_unlock(&devfreq->loc=
k);
009cb1af01de85 Saravana Kannan 2021-03-02  202  	if (ret) {
009cb1af01de85 Saravana Kannan 2021-03-02  203  		parent_cpu_data->cur_freq=
 =3D cur_freq;
009cb1af01de85 Saravana Kannan 2021-03-02  204  		dev_err(&devfreq->dev, "f=
ailed to update the frequency.\n");
009cb1af01de85 Saravana Kannan 2021-03-02  205  		return ret;
009cb1af01de85 Saravana Kannan 2021-03-02  206  	}
009cb1af01de85 Saravana Kannan 2021-03-02  207  =

009cb1af01de85 Saravana Kannan 2021-03-02  208  	return 0;
009cb1af01de85 Saravana Kannan 2021-03-02  209  }
009cb1af01de85 Saravana Kannan 2021-03-02  210  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8443750608891634412==--

