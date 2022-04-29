Content-Type: multipart/mixed; boundary="===============8736155727123387000=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7270/7959] drivers/firmware/arm_scmi/clock.c:242:40: warning: Variable 'msg' is not assigned a value. [unassignedVariable]
Date: Sat, 30 Apr 2022 07:25:43 +0800
Message-ID: <202204300700.V0ngqW5s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8736155727123387000==
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
commit: 7bc7caafe6b1e5b882255a42bc1bf112fa87b69b [7270/7959] firmware: arm_=
scmi: Use common iterators in the clock protocol
:::::: branch date: 16 hours ago
:::::: commit date: 30 hours ago
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7bc7caafe6b1e5b882255a42bc1bf112fa87b69b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/arm_scmi/clock.c:242:40: warning: Variable 'msg' is not=
 assigned a value. [unassignedVariable]
    struct scmi_msg_clock_describe_rates *msg;
                                          ^
--
>> drivers/firmware/arm_scmi/sensors.c:341:48: warning: Variable 'msg' is n=
ot assigned a value. [unassignedVariable]
    struct scmi_msg_sensor_list_update_intervals *msg;
                                                  ^
   drivers/firmware/arm_scmi/sensors.c:462:47: warning: Variable 'msg' is n=
ot assigned a value. [unassignedVariable]
    struct scmi_msg_sensor_axis_description_get *msg;
                                                 ^
   drivers/firmware/arm_scmi/sensors.c:484:47: warning: Variable 'msg' is n=
ot assigned a value. [unassignedVariable]
    struct scmi_msg_sensor_axis_description_get *msg;
                                                 ^

vim +/msg +242 drivers/firmware/arm_scmi/clock.c

9724722fde8f9bb Sudeep Holla     2020-10-12  234  =

7bc7caafe6b1e5b Cristian Marussi 2022-03-30  235  static int
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  236  scmi_clock_describe_rates=
_get(const struct scmi_protocol_handle *ph, u32 clk_id,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  237  			      struct scmi_cloc=
k_info *clk)
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  238  {
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  239  	int ret;
5f6c6430e904d21 Sudeep Holla     2017-06-06  240  =

7bc7caafe6b1e5b Cristian Marussi 2022-03-30  241  	void *iter;
7bc7caafe6b1e5b Cristian Marussi 2022-03-30 @242  	struct scmi_msg_clock_de=
scribe_rates *msg;
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  243  	struct scmi_iterator_ops=
 ops =3D {
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  244  		.prepare_message =3D it=
er_clk_describe_prepare_message,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  245  		.update_state =3D iter_=
clk_describe_update_state,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  246  		.process_response =3D i=
ter_clk_describe_process_response,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  247  	};
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  248  	struct scmi_clk_ipriv cp=
riv =3D {
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  249  		.clk_id =3D clk_id,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  250  		.clk =3D clk,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  251  	};
5f6c6430e904d21 Sudeep Holla     2017-06-06  252  =

7bc7caafe6b1e5b Cristian Marussi 2022-03-30  253  	iter =3D ph->hops->iter_=
response_init(ph, &ops, SCMI_MAX_NUM_RATES,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  254  					    CLOCK_DESCRIBE_R=
ATES,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  255  					    sizeof(*msg), &c=
priv);
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  256  	if (IS_ERR(iter))
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  257  		return PTR_ERR(iter);
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  258  =

7bc7caafe6b1e5b Cristian Marussi 2022-03-30  259  	ret =3D ph->hops->iter_r=
esponse_run(iter);
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  260  	if (ret)
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  261  		return ret;
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  262  =

7bc7caafe6b1e5b Cristian Marussi 2022-03-30  263  	if (!clk->rate_discrete)=
 {
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  264  		dev_dbg(ph->dev, "Min %=
llu Max %llu Step %llu Hz\n",
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  265  			clk->range.min_rate, c=
lk->range.max_rate,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  266  			clk->range.step_size);
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  267  	} else if (clk->list.num=
_rates) {
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  268  		sort(clk->list.rates, c=
lk->list.num_rates,
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  269  		     sizeof(clk->list.r=
ates[0]), rate_cmp_func, NULL);
7bc7caafe6b1e5b Cristian Marussi 2022-03-30  270  	}
c0759b9b5d411ab Peng Fan         2019-05-22  271  =

5f6c6430e904d21 Sudeep Holla     2017-06-06  272  	return ret;
5f6c6430e904d21 Sudeep Holla     2017-06-06  273  }
5f6c6430e904d21 Sudeep Holla     2017-06-06  274  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8736155727123387000==--

