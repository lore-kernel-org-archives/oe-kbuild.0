Content-Type: multipart/mixed; boundary="===============2127098582216909011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/clock.c:242:40: warning: Variable 'msg' is not assigned a value. [unassignedVariable]
Date: Fri, 27 May 2022 16:35:42 +0800
Message-ID: <202205271608.aIWtyM7b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2127098582216909011==
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
commit: 7bc7caafe6b1e5b882255a42bc1bf112fa87b69b firmware: arm_scmi: Use co=
mmon iterators in the clock protocol
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7bc7caafe6b1e5b882255a42bc1bf112fa87b69b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/clock.c:242:40: warning: Variable 'msg' is not=
 assigned a value. [unassignedVariable]
    struct scmi_msg_clock_describe_rates *msg;
                                          ^

vim +/msg +242 drivers/firmware/arm_scmi/clock.c

9724722fde8f9b Sudeep Holla     2020-10-12  234  =

7bc7caafe6b1e5 Cristian Marussi 2022-03-30  235  static int
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  236  scmi_clock_describe_rates_=
get(const struct scmi_protocol_handle *ph, u32 clk_id,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  237  			      struct scmi_clock=
_info *clk)
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  238  {
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  239  	int ret;
5f6c6430e904d2 Sudeep Holla     2017-06-06  240  =

7bc7caafe6b1e5 Cristian Marussi 2022-03-30  241  	void *iter;
7bc7caafe6b1e5 Cristian Marussi 2022-03-30 @242  	struct scmi_msg_clock_des=
cribe_rates *msg;
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  243  	struct scmi_iterator_ops =
ops =3D {
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  244  		.prepare_message =3D ite=
r_clk_describe_prepare_message,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  245  		.update_state =3D iter_c=
lk_describe_update_state,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  246  		.process_response =3D it=
er_clk_describe_process_response,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  247  	};
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  248  	struct scmi_clk_ipriv cpr=
iv =3D {
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  249  		.clk_id =3D clk_id,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  250  		.clk =3D clk,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  251  	};
5f6c6430e904d2 Sudeep Holla     2017-06-06  252  =

7bc7caafe6b1e5 Cristian Marussi 2022-03-30  253  	iter =3D ph->hops->iter_r=
esponse_init(ph, &ops, SCMI_MAX_NUM_RATES,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  254  					    CLOCK_DESCRIBE_RA=
TES,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  255  					    sizeof(*msg), &cp=
riv);
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  256  	if (IS_ERR(iter))
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  257  		return PTR_ERR(iter);
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  258  =

7bc7caafe6b1e5 Cristian Marussi 2022-03-30  259  	ret =3D ph->hops->iter_re=
sponse_run(iter);
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  260  	if (ret)
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  261  		return ret;
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  262  =

7bc7caafe6b1e5 Cristian Marussi 2022-03-30  263  	if (!clk->rate_discrete) {
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  264  		dev_dbg(ph->dev, "Min %l=
lu Max %llu Step %llu Hz\n",
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  265  			clk->range.min_rate, cl=
k->range.max_rate,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  266  			clk->range.step_size);
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  267  	} else if (clk->list.num_=
rates) {
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  268  		sort(clk->list.rates, cl=
k->list.num_rates,
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  269  		     sizeof(clk->list.ra=
tes[0]), rate_cmp_func, NULL);
7bc7caafe6b1e5 Cristian Marussi 2022-03-30  270  	}
c0759b9b5d411a Peng Fan         2019-05-22  271  =

5f6c6430e904d2 Sudeep Holla     2017-06-06  272  	return ret;
5f6c6430e904d2 Sudeep Holla     2017-06-06  273  }
5f6c6430e904d2 Sudeep Holla     2017-06-06  274  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2127098582216909011==--

