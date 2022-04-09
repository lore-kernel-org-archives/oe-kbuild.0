Content-Type: multipart/mixed; boundary="===============6970069642830016358=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/macsec.c:4024:6: warning: Local variable 'send_sci' shadows outer function [shadowFunction]
Date: Sun, 10 Apr 2022 04:25:45 +0800
Message-ID: <202204100436.VElI8nEP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6970069642830016358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lior Nahmanson <liorna@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Raed Salem <raeds@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: d0cfa548dbde354de986911d3913897b5448faad net: macsec: Verify that s=
end_sci is on when setting Tx sci explicitly
date:   10 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 weeks ago
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d0cfa548dbde354de986911d3913897b5448faad
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   drivers/net/macsec.c:3824:7: warning: Local variable 'ret' shadows outer=
 variable [shadowVariable]
     int ret;
         ^
   drivers/net/macsec.c:3799:6: note: Shadowed declaration
    int ret;
        ^
   drivers/net/macsec.c:3824:7: note: Shadow variable
     int ret;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/sched/sch_taprio.c:1132:22: warning: Uninitialized variable: entry->=
interval [uninitvar]
     interval +=3D entry->interval;
                        ^
   net/sched/sch_taprio.c:1241:51: warning: Uninitialized variable: entry->=
gate_mask [uninitvar]
     e->gate_mask =3D tc_map_to_queue_mask(dev, entry->gate_mask);
                                                     ^
--
>> drivers/net/macsec.c:4024:6: warning: Local variable 'send_sci' shadows =
outer function [shadowFunction]
     u8 send_sci =3D !!nla_get_u8(data[IFLA_MACSEC_INC_SCI]);
        ^
   drivers/net/macsec.c:245:13: note: Shadowed declaration
   static bool send_sci(const struct macsec_secy *secy)
               ^
   drivers/net/macsec.c:4024:6: note: Shadow variable
     u8 send_sci =3D !!nla_get_u8(data[IFLA_MACSEC_INC_SCI]);
        ^
>> drivers/net/macsec.c:1009:37: warning: Uninitialized variable: macsec->s=
ecy [uninitvar]
     struct net_device *ndev =3D macsec->secy.netdev;
                                       ^
   drivers/net/macsec.c:3940:15: warning: Uninitialized variable: macsec->s=
ecy [uninitvar]
     if (macsec->secy.sci =3D=3D sci)
                 ^
>> drivers/net/macsec.c:4294:32: warning: Uninitialized variable: m->secy [=
uninitvar]
      struct net_device *dev =3D m->secy.netdev;
                                  ^
   drivers/net/macsec.c:4306:29: warning: Uninitialized variable: m->secy [=
uninitvar]
      macsec_common_dellink(m->secy.netdev, &head);
                               ^
   drivers/net/macsec.c:4321:32: warning: Uninitialized variable: m->secy [=
uninitvar]
      struct net_device *dev =3D m->secy.netdev;
                                  ^

vim +/send_sci +4024 drivers/net/macsec.c

845e0ebb4408d44 Cong Wang         2020-06-08  3986  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3987  static int macsec_newli=
nk(struct net *net, struct net_device *dev,
7a3f4a185169b19 Matthias Schiffer 2017-06-25  3988  			  struct nlattr *tb[=
], struct nlattr *data[],
7a3f4a185169b19 Matthias Schiffer 2017-06-25  3989  			  struct netlink_ext=
_ack *extack)
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3990  {
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3991  	struct macsec_dev *mac=
sec =3D macsec_priv(dev);
7f327080364abcc Taehee Yoo        2020-04-23  3992  	rx_handler_func_t *rx_=
handler;
7f327080364abcc Taehee Yoo        2020-04-23  3993  	u8 icv_len =3D DEFAULT=
_ICV_LEN;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3994  	struct net_device *rea=
l_dev;
7f327080364abcc Taehee Yoo        2020-04-23  3995  	int err, mtu;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3996  	sci_t sci;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3997  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3998  	if (!tb[IFLA_LINK])
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  3999  		return -EINVAL;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4000  	real_dev =3D __dev_get=
_by_index(net, nla_get_u32(tb[IFLA_LINK]));
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4001  	if (!real_dev)
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4002  		return -ENODEV;
b06d072ccc4b1ac Willem de Bruijn  2020-03-22  4003  	if (real_dev->type !=
=3D ARPHRD_ETHER)
b06d072ccc4b1ac Willem de Bruijn  2020-03-22  4004  		return -EINVAL;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4005  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4006  	dev->priv_flags |=3D I=
FF_MACSEC;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4007  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4008  	macsec->real_dev =3D r=
eal_dev;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4009  =

791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4010  	if (data && data[IFLA_=
MACSEC_OFFLOAD])
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4011  		macsec->offload =3D n=
la_get_offload(data[IFLA_MACSEC_OFFLOAD]);
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4012  	else
3cf3227a21d1fb0 Antoine Tenart    2020-01-13  4013  		/* MACsec offloading =
is off by default */
3cf3227a21d1fb0 Antoine Tenart    2020-01-13  4014  		macsec->offload =3D M=
ACSEC_OFFLOAD_OFF;
3cf3227a21d1fb0 Antoine Tenart    2020-01-13  4015  =

791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4016  	/* Check if the offloa=
ding mode is supported by the underlying layers */
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4017  	if (macsec->offload !=
=3D MACSEC_OFFLOAD_OFF &&
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4018  	    !macsec_check_offl=
oad(macsec->offload, macsec))
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4019  		return -EOPNOTSUPP;
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4020  =

d0cfa548dbde354 Lior Nahmanson    2022-01-30  4021  	/* send_sci must be se=
t to true when transmit sci explicitly is set */
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4022  	if ((data && data[IFLA=
_MACSEC_SCI]) &&
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4023  	    (data && data[IFLA=
_MACSEC_INC_SCI])) {
d0cfa548dbde354 Lior Nahmanson    2022-01-30 @4024  		u8 send_sci =3D !!nla=
_get_u8(data[IFLA_MACSEC_INC_SCI]);
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4025  =

d0cfa548dbde354 Lior Nahmanson    2022-01-30  4026  		if (!send_sci)
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4027  			return -EINVAL;
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4028  	}
d0cfa548dbde354 Lior Nahmanson    2022-01-30  4029  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4030  	if (data && data[IFLA_=
MACSEC_ICV_LEN])
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4031  		icv_len =3D nla_get_u=
8(data[IFLA_MACSEC_ICV_LEN]);
7f327080364abcc Taehee Yoo        2020-04-23  4032  	mtu =3D real_dev->mtu =
- icv_len - macsec_extra_len(true);
7f327080364abcc Taehee Yoo        2020-04-23  4033  	if (mtu < 0)
7f327080364abcc Taehee Yoo        2020-04-23  4034  		dev->mtu =3D 0;
7f327080364abcc Taehee Yoo        2020-04-23  4035  	else
7f327080364abcc Taehee Yoo        2020-04-23  4036  		dev->mtu =3D mtu;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4037  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4038  	rx_handler =3D rtnl_de=
reference(real_dev->rx_handler);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4039  	if (rx_handler && rx_h=
andler !=3D macsec_handle_frame)
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4040  		return -EBUSY;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4041  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4042  	err =3D register_netde=
vice(dev);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4043  	if (err < 0)
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4044  		return err;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4045  =

1a33e10e4a95cb1 Cong Wang         2020-05-02  4046  	netdev_lockdep_set_cla=
sses(dev);
be74294ffa24f5f Cong Wang         2020-06-26  4047  	lockdep_set_class(&dev=
->addr_list_lock,
be74294ffa24f5f Cong Wang         2020-06-26  4048  			  &macsec_netdev_add=
r_lock_key);
1a33e10e4a95cb1 Cong Wang         2020-05-02  4049  =

42ab19ee9029299 David Ahern       2017-10-04  4050  	err =3D netdev_upper_d=
ev_link(real_dev, dev, extack);
e20038724552cd0 Sabrina Dubroca   2016-08-12  4051  	if (err < 0)
bd28899dd34f928 Dan Carpenter     2018-04-16  4052  		goto unregister;
e20038724552cd0 Sabrina Dubroca   2016-08-12  4053  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4054  	/* need to be already =
registered so that ->init has run and
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4055  	 * the MAC addr is set
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4056  	 */
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4057  	if (data && data[IFLA_=
MACSEC_SCI])
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4058  		sci =3D nla_get_sci(d=
ata[IFLA_MACSEC_SCI]);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4059  	else if (data && data[=
IFLA_MACSEC_PORT])
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4060  		sci =3D dev_to_sci(de=
v, nla_get_be16(data[IFLA_MACSEC_PORT]));
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4061  	else
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4062  		sci =3D dev_to_sci(de=
v, MACSEC_PORT_ES);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4063  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4064  	if (rx_handler && sci_=
exists(real_dev, sci)) {
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4065  		err =3D -EBUSY;
e20038724552cd0 Sabrina Dubroca   2016-08-12  4066  		goto unlink;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4067  	}
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4068  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4069  	err =3D macsec_add_dev=
(dev, sci, icv_len);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4070  	if (err)
e20038724552cd0 Sabrina Dubroca   2016-08-12  4071  		goto unlink;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4072  =

ccfdec908922950 Felix Walter      2018-01-05  4073  	if (data) {
ccfdec908922950 Felix Walter      2018-01-05  4074  		err =3D macsec_change=
link_common(dev, data);
ccfdec908922950 Felix Walter      2018-01-05  4075  		if (err)
ccfdec908922950 Felix Walter      2018-01-05  4076  			goto del_dev;
ccfdec908922950 Felix Walter      2018-01-05  4077  	}
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4078  =

791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4079  	/* If h/w offloading i=
s available, propagate to the device */
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4080  	if (macsec_is_offloade=
d(macsec)) {
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4081  		const struct macsec_o=
ps *ops;
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4082  		struct macsec_context=
 ctx;
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4083  =

791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4084  		ops =3D macsec_get_op=
s(macsec, &ctx);
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4085  		if (ops) {
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4086  			ctx.secy =3D &macsec=
->secy;
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4087  			err =3D macsec_offlo=
ad(ops->mdo_add_secy, &ctx);
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4088  			if (err)
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4089  				goto del_dev;
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4090  		}
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4091  	}
791bb3fcafcedd1 Mark Starovoytov  2020-03-25  4092  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4093  	err =3D register_macse=
c_dev(real_dev, dev);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4094  	if (err < 0)
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4095  		goto del_dev;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4096  =

e6ac075882b2afc Sabrina Dubroca   2018-10-28  4097  	netif_stacked_transfer=
_operstate(real_dev, dev);
e6ac075882b2afc Sabrina Dubroca   2018-10-28  4098  	linkwatch_fire_event(d=
ev);
e6ac075882b2afc Sabrina Dubroca   2018-10-28  4099  =

96cfc5052c5d434 Sabrina Dubroca   2016-04-22  4100  	macsec_generation++;
96cfc5052c5d434 Sabrina Dubroca   2016-04-22  4101  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4102  	return 0;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4103  =

c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4104  del_dev:
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4105  	macsec_del_dev(macsec);
e20038724552cd0 Sabrina Dubroca   2016-08-12  4106  unlink:
e20038724552cd0 Sabrina Dubroca   2016-08-12  4107  	netdev_upper_dev_unlin=
k(real_dev, dev);
bd28899dd34f928 Dan Carpenter     2018-04-16  4108  unregister:
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4109  	unregister_netdevice(d=
ev);
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4110  	return err;
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4111  }
c09440f7dcb3040 Sabrina Dubroca   2016-03-11  4112  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6970069642830016358==--

