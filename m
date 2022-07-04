Content-Type: multipart/mixed; boundary="===============1995323988385242841=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/devfreq/governor_passive.c:44:24: warning: Uninitialized variable: parent_cpu_data->opp_table [uninitvar]
Date: Mon, 04 Jul 2022 23:45:22 +0800
Message-ID: <202207042315.qeZ4qEvs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1995323988385242841==
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
:::::: branch date: 17 hours ago
:::::: commit date: 5 days ago
compiler: or1k-linux-gcc (GCC) 11.3.0
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
--===============1995323988385242841==--

