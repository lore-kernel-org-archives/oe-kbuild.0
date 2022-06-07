Content-Type: multipart/mixed; boundary="===============0952001013863765234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/5] PM / devfreq: Fix cpufreq passive unregister erroring on PROBE_DEFER
Date: Tue, 07 Jun 2022 10:48:54 +0800
Message-ID: <202206071052.9km2HTBI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0952001013863765234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/d=
evfreq/governor_passive.c:238:24: warning: Uninitialized variable: parent_c=
pu_data->opp_table [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220606111104.14534-2-ansuelsmth@gmail.com>
References: <20220606111104.14534-2-ansuelsmth@gmail.com>
TO: "Christian 'Ansuel' Marangi" <ansuelsmth@gmail.com>
TO: MyungJoo Ham <myungjoo.ham@samsung.com>
TO: Kyungmin Park <kyungmin.park@samsung.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Saravana Kannan <skannan@codeaurora.org>
TO: Sibi Sankar <sibis@codeaurora.org>
TO: linux-pm(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: "Christian 'Ansuel' Marangi" <ansuelsmth@gmail.com>

Hi Christian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on chanwoo/devfreq-testing]
[also build test WARNING on linus/master v5.19-rc1 next-20220606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Ansuel-Mar=
angi/PM-devfreq-Various-Fixes-to-cpufreq-based-passive-governor/20220606-19=
1335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git d=
evfreq-testing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2d59e1f0c418bf7a6fb2396c60a643994b4c4aba
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/devfreq/governor_passive.c:238:24: warning: Uninitialized variab=
le: parent_cpu_data->opp_table [uninitvar]
     if (parent_cpu_data->opp_table)
                          ^

vim +238 drivers/devfreq/governor_passive.c

a03dacb0316f74 Saravana Kannan            2021-03-02  220  =

a03dacb0316f74 Saravana Kannan            2021-03-02  221  static int cpufr=
eq_passive_unregister_notifier(struct devfreq *devfreq)
a03dacb0316f74 Saravana Kannan            2021-03-02  222  {
a03dacb0316f74 Saravana Kannan            2021-03-02  223  	struct devfreq_=
passive_data *p_data
a03dacb0316f74 Saravana Kannan            2021-03-02  224  			=3D (struct d=
evfreq_passive_data *)devfreq->data;
a03dacb0316f74 Saravana Kannan            2021-03-02  225  	struct devfreq_=
cpu_data *parent_cpu_data;
2d59e1f0c418bf Christian 'Ansuel' Marangi 2022-06-06  226  	int ret;
a03dacb0316f74 Saravana Kannan            2021-03-02  227  =

a03dacb0316f74 Saravana Kannan            2021-03-02  228  	if (p_data->nb.=
notifier_call) {
a03dacb0316f74 Saravana Kannan            2021-03-02  229  		ret =3D cpufre=
q_unregister_notifier(&p_data->nb,
a03dacb0316f74 Saravana Kannan            2021-03-02  230  					CPUFREQ_TRA=
NSITION_NOTIFIER);
a03dacb0316f74 Saravana Kannan            2021-03-02  231  		if (ret < 0)
a03dacb0316f74 Saravana Kannan            2021-03-02  232  			return ret;
a03dacb0316f74 Saravana Kannan            2021-03-02  233  	}
a03dacb0316f74 Saravana Kannan            2021-03-02  234  =

2d59e1f0c418bf Christian 'Ansuel' Marangi 2022-06-06  235  	list_for_each_e=
ntry(parent_cpu_data, &p_data->cpu_data_list, node) {
26984d9d581e50 Chanwoo Choi               2022-04-27  236  		list_del(&pare=
nt_cpu_data->node);
2d59e1f0c418bf Christian 'Ansuel' Marangi 2022-06-06  237  =

a03dacb0316f74 Saravana Kannan            2021-03-02 @238  		if (parent_cpu=
_data->opp_table)
a03dacb0316f74 Saravana Kannan            2021-03-02  239  			dev_pm_opp_pu=
t_opp_table(parent_cpu_data->opp_table);
2d59e1f0c418bf Christian 'Ansuel' Marangi 2022-06-06  240  =

a03dacb0316f74 Saravana Kannan            2021-03-02  241  		kfree(parent_c=
pu_data);
a03dacb0316f74 Saravana Kannan            2021-03-02  242  	}
a03dacb0316f74 Saravana Kannan            2021-03-02  243  =

2d59e1f0c418bf Christian 'Ansuel' Marangi 2022-06-06  244  	return 0;
a03dacb0316f74 Saravana Kannan            2021-03-02  245  }
a03dacb0316f74 Saravana Kannan            2021-03-02  246  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0952001013863765234==--

