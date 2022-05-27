Content-Type: multipart/mixed; boundary="===============9128974207693827772=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/perf.c:331:40: warning: Variable 'msg' is not assigned a value. [unassignedVariable]
Date: Fri, 27 May 2022 17:48:22 +0800
Message-ID: <202205271734.Shs6YLGG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9128974207693827772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e284070abe53d448517b80493863595af4ab5f0
commit: 79d2ea9244180bf76537c23406d838db955a57b5 firmware: arm_scmi: Use co=
mmon iterators in the perf protocol
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 79d2ea9244180bf76537c23406d838db955a57b5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
--===============9128974207693827772==--

