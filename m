Content-Type: multipart/mixed; boundary="===============5900439588037267078=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chanwoo:devfreq-testing 4/5] drivers/devfreq/governor_passive.c:35:8-23: ERROR: invalid reference to the index variable of the iterator on line 30
Date: Sat, 07 May 2022 15:43:20 +0800
Message-ID: <202205071527.dXsoHdmA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5900439588037267078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chanwoo Choi <cw00.choi@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing
head:   3dd907854148029c259fb7706295faf9222d7544
commit: 1aa7d7975a817db4c1c4ada116a777e3654f224d [4/5] PM / devfreq: passiv=
e: Keep cpufreq_policy for possible cpus
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-c023-20220506 (https://download.01.org/0day-ci/arc=
hive/20220507/202205071527.dXsoHdmA-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/devfreq/governor_passive.c:35:8-23: ERROR: invalid reference to =
the index variable of the iterator on line 30

vim +35 drivers/devfreq/governor_passive.c

38d5903c1095fb Saravana Kannan 2021-03-02  20  =

1aa7d7975a817d Chanwoo Choi    2022-04-27  21  static struct devfreq_cpu_da=
ta *
1aa7d7975a817d Chanwoo Choi    2022-04-27  22  get_parent_cpu_data(struct d=
evfreq_passive_data *p_data,
1aa7d7975a817d Chanwoo Choi    2022-04-27  23  		    struct cpufreq_policy =
*policy)
1aa7d7975a817d Chanwoo Choi    2022-04-27  24  {
1aa7d7975a817d Chanwoo Choi    2022-04-27  25  	struct devfreq_cpu_data *pa=
rent_cpu_data =3D NULL;
1aa7d7975a817d Chanwoo Choi    2022-04-27  26  =

1aa7d7975a817d Chanwoo Choi    2022-04-27  27  	if (!p_data || !policy)
1aa7d7975a817d Chanwoo Choi    2022-04-27  28  		return NULL;
1aa7d7975a817d Chanwoo Choi    2022-04-27  29  =

1aa7d7975a817d Chanwoo Choi    2022-04-27 @30  	list_for_each_entry(parent_=
cpu_data, &p_data->cpu_data_list, node) {
1aa7d7975a817d Chanwoo Choi    2022-04-27  31  		if (parent_cpu_data->first=
_cpu =3D=3D cpumask_first(policy->related_cpus))
1aa7d7975a817d Chanwoo Choi    2022-04-27  32  			break;
1aa7d7975a817d Chanwoo Choi    2022-04-27  33  	}
1aa7d7975a817d Chanwoo Choi    2022-04-27  34  =

1aa7d7975a817d Chanwoo Choi    2022-04-27 @35  	return parent_cpu_data;
1aa7d7975a817d Chanwoo Choi    2022-04-27  36  }
1aa7d7975a817d Chanwoo Choi    2022-04-27  37  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5900439588037267078==--

