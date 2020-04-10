Content-Type: multipart/mixed; boundary="===============8366211182559370350=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [lee:android-3.18-preview 119/185] net/batman-adv/bat_iv_ogm.c:342 batadv_iv_ogm_iface_enable() error: double unlocked 'hard_iface->bat_iv.ogm_buff_mutex' (orig line 325)
Date: Sat, 11 Apr 2020 00:37:01 +0800
Message-ID: <202004110030.8gildiga%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8366211182559370350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lee Jones <lee.jones@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/linux.git andro=
id-3.18-preview
head:   50896cc052e256af7bc02e3202c5c2c3d3bebbee
commit: 8ce6294364ab0866e1a36598fc3a4ea8e9c216a0 [119/185] batman-adv: Avoi=
d free/alloc race when handling OGM buffer
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/batman-adv/bat_iv_ogm.c:342 batadv_iv_ogm_iface_enable() error: double =
unlocked 'hard_iface->bat_iv.ogm_buff_mutex' (orig line 325)

# https://git.kernel.org/pub/scm/linux/kernel/git/lee/linux.git/commit/?id=
=3D8ce6294364ab0866e1a36598fc3a4ea8e9c216a0
git remote add lee https://git.kernel.org/pub/scm/linux/kernel/git/lee/linu=
x.git
git remote update lee
git checkout 8ce6294364ab0866e1a36598fc3a4ea8e9c216a0
vim +342 net/batman-adv/bat_iv_ogm.c

7ae8b2852f946c Marek Lindner    2012-03-01  308  =

56303d34a332be Sven Eckelmann   2012-06-05  309  static int batadv_iv_ogm_i=
face_enable(struct batadv_hard_iface *hard_iface)
d0b9fd89c2e446 Marek Lindner    2011-07-30  310  {
96412690116afc Sven Eckelmann   2012-06-05  311  	struct batadv_ogm_packet =
*batadv_ogm_packet;
14511519d4b49a Marek Lindner    2012-08-02  312  	unsigned char *ogm_buff;
d7d32ec0f199cc Marek Lindner    2012-02-07  313  	uint32_t random_seqno;
5346c35ebfbdb1 Sven Eckelmann   2012-05-05  314  	int res =3D -ENOMEM;
d7d32ec0f199cc Marek Lindner    2012-02-07  315  =

8ce6294364ab08 Sven Eckelmann   2020-03-18  316  	mutex_lock(&hard_iface->b=
at_iv.ogm_buff_mutex);
8ce6294364ab08 Sven Eckelmann   2020-03-18  317  =

d7d32ec0f199cc Marek Lindner    2012-02-07  318  	/* randomize initial seqn=
o to avoid collision */
d7d32ec0f199cc Marek Lindner    2012-02-07  319  	get_random_bytes(&random_=
seqno, sizeof(random_seqno));
14511519d4b49a Marek Lindner    2012-08-02  320  	atomic_set(&hard_iface->b=
at_iv.ogm_seqno, random_seqno);
d0b9fd89c2e446 Marek Lindner    2011-07-30  321  =

14511519d4b49a Marek Lindner    2012-08-02  322  	hard_iface->bat_iv.ogm_bu=
ff_len =3D BATADV_OGM_HLEN;
14511519d4b49a Marek Lindner    2012-08-02  323  	ogm_buff =3D kmalloc(hard=
_iface->bat_iv.ogm_buff_len, GFP_ATOMIC);
8ce6294364ab08 Sven Eckelmann   2020-03-18  324  	if (!ogm_buff) {
8ce6294364ab08 Sven Eckelmann   2020-03-18 @325  		mutex_unlock(&hard_iface=
->bat_iv.ogm_buff_mutex);
77af7575c4b11c Marek Lindner    2012-02-07  326  		goto out;
8ce6294364ab08 Sven Eckelmann   2020-03-18  327  	}
77af7575c4b11c Marek Lindner    2012-02-07  328  =

14511519d4b49a Marek Lindner    2012-08-02  329  	hard_iface->bat_iv.ogm_bu=
ff =3D ogm_buff;
14511519d4b49a Marek Lindner    2012-08-02  330  =

14511519d4b49a Marek Lindner    2012-08-02  331  	batadv_ogm_packet =3D (st=
ruct batadv_ogm_packet *)ogm_buff;
a40d9b075c21f0 Simon Wunderlich 2013-12-02  332  	batadv_ogm_packet->packet=
_type =3D BATADV_IV_OGM;
a40d9b075c21f0 Simon Wunderlich 2013-12-02  333  	batadv_ogm_packet->versio=
n =3D BATADV_COMPAT_VERSION;
a40d9b075c21f0 Simon Wunderlich 2013-12-02  334  	batadv_ogm_packet->ttl =
=3D 2;
96412690116afc Sven Eckelmann   2012-06-05  335  	batadv_ogm_packet->flags =
=3D BATADV_NO_FLAGS;
414254e342a0d5 Marek Lindner    2013-04-23  336  	batadv_ogm_packet->reserv=
ed =3D 0;
96412690116afc Sven Eckelmann   2012-06-05  337  	batadv_ogm_packet->tq =3D=
 BATADV_TQ_MAX_VALUE;
77af7575c4b11c Marek Lindner    2012-02-07  338  =

77af7575c4b11c Marek Lindner    2012-02-07  339  	res =3D 0;
77af7575c4b11c Marek Lindner    2012-02-07  340  =

77af7575c4b11c Marek Lindner    2012-02-07  341  out:
8ce6294364ab08 Sven Eckelmann   2020-03-18 @342  	mutex_unlock(&hard_iface-=
>bat_iv.ogm_buff_mutex);
8ce6294364ab08 Sven Eckelmann   2020-03-18  343  =

77af7575c4b11c Marek Lindner    2012-02-07  344  	return res;
d0b9fd89c2e446 Marek Lindner    2011-07-30  345  }
d0b9fd89c2e446 Marek Lindner    2011-07-30  346  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8366211182559370350==--

