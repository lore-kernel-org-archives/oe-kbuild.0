Content-Type: multipart/mixed; boundary="===============0292782586050078847=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7272/7959] drivers/firmware/arm_scmi/perf.c:331:40: warning: Variable 'msg' is not assigned a value. [unassignedVariable]
Date: Sat, 30 Apr 2022 08:36:59 +0800
Message-ID: <202204300849.0wCfYgvg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0292782586050078847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: 79d2ea9244180bf76537c23406d838db955a57b5 [7272/7959] firmware: arm_=
scmi: Use common iterators in the perf protocol
:::::: branch date: 17 hours ago
:::::: commit date: 31 hours ago
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 79d2ea9244180bf76537c23406d838db955a57b5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/voltage.c:177:39: warning: Variable 'msg' is n=
ot assigned a value. [unassignedVariable]
    struct scmi_msg_cmd_describe_levels *msg;
                                         ^
--
>> drivers/firmware/arm_scmi/perf.c:331:40: warning: Variable 'msg' is not =
assigned a value. [unassignedVariable]
    struct scmi_msg_perf_describe_levels *msg;
                                          ^

vim +/msg +331 drivers/firmware/arm_scmi/perf.c

a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  324  =

79d2ea9244180b Cristian Marussi 2022-03-30  325  static int
79d2ea9244180b Cristian Marussi 2022-03-30  326  scmi_perf_describe_levels_=
get(const struct scmi_protocol_handle *ph, u32 domain,
79d2ea9244180b Cristian Marussi 2022-03-30  327  			      struct perf_dom_i=
nfo *perf_dom)
79d2ea9244180b Cristian Marussi 2022-03-30  328  {
79d2ea9244180b Cristian Marussi 2022-03-30  329  	int ret;
79d2ea9244180b Cristian Marussi 2022-03-30  330  	void *iter;
79d2ea9244180b Cristian Marussi 2022-03-30 @331  	struct scmi_msg_perf_desc=
ribe_levels *msg;
79d2ea9244180b Cristian Marussi 2022-03-30  332  	struct scmi_iterator_ops =
ops =3D {
79d2ea9244180b Cristian Marussi 2022-03-30  333  		.prepare_message =3D ite=
r_perf_levels_prepare_message,
79d2ea9244180b Cristian Marussi 2022-03-30  334  		.update_state =3D iter_p=
erf_levels_update_state,
79d2ea9244180b Cristian Marussi 2022-03-30  335  		.process_response =3D it=
er_perf_levels_process_response,
79d2ea9244180b Cristian Marussi 2022-03-30  336  	};
79d2ea9244180b Cristian Marussi 2022-03-30  337  	struct scmi_perf_ipriv pp=
riv =3D {
79d2ea9244180b Cristian Marussi 2022-03-30  338  		.domain =3D domain,
79d2ea9244180b Cristian Marussi 2022-03-30  339  		.perf_dom =3D perf_dom,
79d2ea9244180b Cristian Marussi 2022-03-30  340  	};
9724722fde8f9b Sudeep Holla     2020-10-12  341  =

79d2ea9244180b Cristian Marussi 2022-03-30  342  	iter =3D ph->hops->iter_r=
esponse_init(ph, &ops, MAX_OPPS,
79d2ea9244180b Cristian Marussi 2022-03-30  343  					    PERF_DESCRIBE_LEV=
ELS,
79d2ea9244180b Cristian Marussi 2022-03-30  344  					    sizeof(*msg), &pp=
riv);
79d2ea9244180b Cristian Marussi 2022-03-30  345  	if (IS_ERR(iter))
79d2ea9244180b Cristian Marussi 2022-03-30  346  		return PTR_ERR(iter);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  347  =

79d2ea9244180b Cristian Marussi 2022-03-30  348  	ret =3D ph->hops->iter_re=
sponse_run(iter);
79d2ea9244180b Cristian Marussi 2022-03-30  349  	if (ret)
79d2ea9244180b Cristian Marussi 2022-03-30  350  		return ret;
79d2ea9244180b Cristian Marussi 2022-03-30  351  =

79d2ea9244180b Cristian Marussi 2022-03-30  352  	if (perf_dom->opp_count)
79d2ea9244180b Cristian Marussi 2022-03-30  353  		sort(perf_dom->opp, perf=
_dom->opp_count,
79d2ea9244180b Cristian Marussi 2022-03-30  354  		     sizeof(struct scmi_=
opp), opp_cmp_func, NULL);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  355  =

a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  356  	return ret;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  357  }
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  358  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0292782586050078847==--

