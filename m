Content-Type: multipart/mixed; boundary="===============6915068465445179284=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/s390/crypto/zcrypt_cex4.c:251 ep11_card_op_modes_show() warn: should '(1 << be a 64 bit
Date: Fri, 12 Jun 2020 12:58:45 +0300
Message-ID: <20200612095845.GE4282@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6915068465445179284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b29482fde649c72441d5478a4ea2c52c56d97a5e
commit: a17becc112535b912f2165f80a98c21b59655119 s390/zcrypt: extend EP11 c=
ard and queue sysfs attributes
config: s390-randconfig-m031-20200611 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/s390/crypto/zcrypt_cex4.c:251 ep11_card_op_modes_show() warn: shoul=
d '(1 << ep11_op_modes[i]->mode_bit)' be a 64 bit type?
drivers/s390/crypto/zcrypt_cex4.c:346 ep11_queue_op_modes_show() warn: shou=
ld '(1 << ep11_op_modes[i]->mode_bit)' be a 64 bit type?

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da17becc112535b912f2165f80a98c21b59655119
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout a17becc112535b912f2165f80a98c21b59655119
vim +251 drivers/s390/crypto/zcrypt_cex4.c

a17becc112535b Harald Freudenberger 2019-08-30  237  static ssize_t ep11_ca=
rd_op_modes_show(struct device *dev,
a17becc112535b Harald Freudenberger 2019-08-30  238  				       struct devi=
ce_attribute *attr,
a17becc112535b Harald Freudenberger 2019-08-30  239  				       char *buf)
a17becc112535b Harald Freudenberger 2019-08-30  240  {
a17becc112535b Harald Freudenberger 2019-08-30  241  	int i, n =3D 0;
a17becc112535b Harald Freudenberger 2019-08-30  242  	struct ep11_card_info=
 ci;
a17becc112535b Harald Freudenberger 2019-08-30  243  	struct ap_card *ac =
=3D to_ap_card(dev);
a17becc112535b Harald Freudenberger 2019-08-30  244  	struct zcrypt_card *z=
c =3D ac->private;
a17becc112535b Harald Freudenberger 2019-08-30  245  =

a17becc112535b Harald Freudenberger 2019-08-30  246  	memset(&ci, 0, sizeof=
(ci));
a17becc112535b Harald Freudenberger 2019-08-30  247  =

a17becc112535b Harald Freudenberger 2019-08-30  248  	ep11_get_card_info(ac=
->id, &ci, zc->online);
a17becc112535b Harald Freudenberger 2019-08-30  249  =

a17becc112535b Harald Freudenberger 2019-08-30  250  	for (i =3D 0; ep11_op=
_modes[i].mode_txt; i++) {
a17becc112535b Harald Freudenberger 2019-08-30 @251  		if (ci.op_mode & (1 =
<< ep11_op_modes[i].mode_bit)) {
                                                                    ^^^^^^^=
^^^
This is a u64 type, which suggests that it should be "1ULL << ep11_op_modes=
[i].mode_bit".

a17becc112535b Harald Freudenberger 2019-08-30  252  			if (n > 0)
a17becc112535b Harald Freudenberger 2019-08-30  253  				buf[n++] =3D ' ';
a17becc112535b Harald Freudenberger 2019-08-30  254  			n +=3D snprintf(buf=
 + n, PAGE_SIZE - n,
a17becc112535b Harald Freudenberger 2019-08-30  255  				      "%s", ep11_o=
p_modes[i].mode_txt);
a17becc112535b Harald Freudenberger 2019-08-30  256  		}
a17becc112535b Harald Freudenberger 2019-08-30  257  	}
a17becc112535b Harald Freudenberger 2019-08-30  258  	n +=3D snprintf(buf +=
 n, PAGE_SIZE - n, "\n");
a17becc112535b Harald Freudenberger 2019-08-30  259  =

a17becc112535b Harald Freudenberger 2019-08-30  260  	return n;
a17becc112535b Harald Freudenberger 2019-08-30  261  }
a17becc112535b Harald Freudenberger 2019-08-30  262  =

a17becc112535b Harald Freudenberger 2019-08-30  263  static struct device_a=
ttribute dev_attr_ep11_card_op_modes =3D
a17becc112535b Harald Freudenberger 2019-08-30  264  	__ATTR(op_modes, 0444=
, ep11_card_op_modes_show, NULL);
a17becc112535b Harald Freudenberger 2019-08-30  265  =

a17becc112535b Harald Freudenberger 2019-08-30  266  static struct attribut=
e *ep11_card_attrs[] =3D {
a17becc112535b Harald Freudenberger 2019-08-30  267  	&dev_attr_ep11_api_or=
dinalnr.attr,
a17becc112535b Harald Freudenberger 2019-08-30  268  	&dev_attr_ep11_fw_ver=
sion.attr,
a17becc112535b Harald Freudenberger 2019-08-30  269  	&dev_attr_ep11_serial=
nr.attr,
a17becc112535b Harald Freudenberger 2019-08-30  270  	&dev_attr_ep11_card_o=
p_modes.attr,
a17becc112535b Harald Freudenberger 2019-08-30  271  	NULL,
a17becc112535b Harald Freudenberger 2019-08-30  272  };
a17becc112535b Harald Freudenberger 2019-08-30  273  =

a17becc112535b Harald Freudenberger 2019-08-30  274  static const struct at=
tribute_group ep11_card_attr_grp =3D {
a17becc112535b Harald Freudenberger 2019-08-30  275  	.attrs =3D ep11_card_=
attrs,
a17becc112535b Harald Freudenberger 2019-08-30  276  };
a17becc112535b Harald Freudenberger 2019-08-30  277  =

a17becc112535b Harald Freudenberger 2019-08-30  278  /*
a17becc112535b Harald Freudenberger 2019-08-30  279   * EP11 queue addition=
al device attributes
a17becc112535b Harald Freudenberger 2019-08-30  280   */
a17becc112535b Harald Freudenberger 2019-08-30  281  =

a17becc112535b Harald Freudenberger 2019-08-30  282  static ssize_t ep11_mk=
vps_show(struct device *dev,
a17becc112535b Harald Freudenberger 2019-08-30  283  			       struct devic=
e_attribute *attr,
a17becc112535b Harald Freudenberger 2019-08-30  284  			       char *buf)
a17becc112535b Harald Freudenberger 2019-08-30  285  {
a17becc112535b Harald Freudenberger 2019-08-30  286  	int n =3D 0;
a17becc112535b Harald Freudenberger 2019-08-30  287  	struct ep11_domain_in=
fo di;
a17becc112535b Harald Freudenberger 2019-08-30  288  	struct zcrypt_queue *=
zq =3D to_ap_queue(dev)->private;
a17becc112535b Harald Freudenberger 2019-08-30  289  	static const char * c=
onst cwk_state[] =3D { "invalid", "valid" };
a17becc112535b Harald Freudenberger 2019-08-30  290  	static const char * c=
onst nwk_state[] =3D { "empty", "uncommitted",
a17becc112535b Harald Freudenberger 2019-08-30  291  						  "committed" };
a17becc112535b Harald Freudenberger 2019-08-30  292  =

a17becc112535b Harald Freudenberger 2019-08-30  293  	memset(&di, 0, sizeof=
(di));
a17becc112535b Harald Freudenberger 2019-08-30  294  =

a17becc112535b Harald Freudenberger 2019-08-30  295  	if (zq->online)
a17becc112535b Harald Freudenberger 2019-08-30  296  		ep11_get_domain_info=
(AP_QID_CARD(zq->queue->qid),
a17becc112535b Harald Freudenberger 2019-08-30  297  				     AP_QID_QUEUE(=
zq->queue->qid),
a17becc112535b Harald Freudenberger 2019-08-30  298  				     &di);
a17becc112535b Harald Freudenberger 2019-08-30  299  =

a17becc112535b Harald Freudenberger 2019-08-30  300  	if (di.cur_wk_state =
=3D=3D '0') {
a17becc112535b Harald Freudenberger 2019-08-30  301  		n =3D snprintf(buf, =
PAGE_SIZE, "WK CUR: %s -\n",
a17becc112535b Harald Freudenberger 2019-08-30  302  			     cwk_state[di.c=
ur_wk_state - '0']);
a17becc112535b Harald Freudenberger 2019-08-30  303  	} else if (di.cur_wk_=
state =3D=3D '1') {
a17becc112535b Harald Freudenberger 2019-08-30  304  		n =3D snprintf(buf, =
PAGE_SIZE, "WK CUR: %s 0x",
a17becc112535b Harald Freudenberger 2019-08-30  305  			     cwk_state[di.c=
ur_wk_state - '0']);
a17becc112535b Harald Freudenberger 2019-08-30  306  		bin2hex(buf + n, di.=
cur_wkvp, sizeof(di.cur_wkvp));
a17becc112535b Harald Freudenberger 2019-08-30  307  		n +=3D 2 * sizeof(di=
.cur_wkvp);
a17becc112535b Harald Freudenberger 2019-08-30  308  		n +=3D snprintf(buf =
+ n, PAGE_SIZE - n, "\n");
a17becc112535b Harald Freudenberger 2019-08-30  309  	} else
a17becc112535b Harald Freudenberger 2019-08-30  310  		n =3D snprintf(buf, =
PAGE_SIZE, "WK CUR: - -\n");
a17becc112535b Harald Freudenberger 2019-08-30  311  =

a17becc112535b Harald Freudenberger 2019-08-30  312  	if (di.new_wk_state =
=3D=3D '0') {
a17becc112535b Harald Freudenberger 2019-08-30  313  		n +=3D snprintf(buf =
+ n, PAGE_SIZE - n, "WK NEW: %s -\n",
a17becc112535b Harald Freudenberger 2019-08-30  314  			      nwk_state[di.=
new_wk_state - '0']);
a17becc112535b Harald Freudenberger 2019-08-30  315  	} else if (di.new_wk_=
state >=3D '1' && di.new_wk_state <=3D '2') {
a17becc112535b Harald Freudenberger 2019-08-30  316  		n +=3D snprintf(buf =
+ n, PAGE_SIZE - n, "WK NEW: %s 0x",
a17becc112535b Harald Freudenberger 2019-08-30  317  			      nwk_state[di.=
new_wk_state - '0']);
a17becc112535b Harald Freudenberger 2019-08-30  318  		bin2hex(buf + n, di.=
new_wkvp, sizeof(di.new_wkvp));
a17becc112535b Harald Freudenberger 2019-08-30  319  		n +=3D 2 * sizeof(di=
.new_wkvp);
a17becc112535b Harald Freudenberger 2019-08-30  320  		n +=3D snprintf(buf =
+ n, PAGE_SIZE - n, "\n");
a17becc112535b Harald Freudenberger 2019-08-30  321  	} else
a17becc112535b Harald Freudenberger 2019-08-30  322  		n +=3D snprintf(buf =
+ n, PAGE_SIZE - n, "WK NEW: - -\n");
a17becc112535b Harald Freudenberger 2019-08-30  323  =

a17becc112535b Harald Freudenberger 2019-08-30  324  	return n;
a17becc112535b Harald Freudenberger 2019-08-30  325  }
a17becc112535b Harald Freudenberger 2019-08-30  326  =

a17becc112535b Harald Freudenberger 2019-08-30  327  static struct device_a=
ttribute dev_attr_ep11_mkvps =3D
a17becc112535b Harald Freudenberger 2019-08-30  328  	__ATTR(mkvps, 0444, e=
p11_mkvps_show, NULL);
a17becc112535b Harald Freudenberger 2019-08-30  329  =

a17becc112535b Harald Freudenberger 2019-08-30  330  static ssize_t ep11_qu=
eue_op_modes_show(struct device *dev,
a17becc112535b Harald Freudenberger 2019-08-30  331  					struct device_att=
ribute *attr,
a17becc112535b Harald Freudenberger 2019-08-30  332  					char *buf)
a17becc112535b Harald Freudenberger 2019-08-30  333  {
a17becc112535b Harald Freudenberger 2019-08-30  334  	int i, n =3D 0;
a17becc112535b Harald Freudenberger 2019-08-30  335  	struct ep11_domain_in=
fo di;
a17becc112535b Harald Freudenberger 2019-08-30  336  	struct zcrypt_queue *=
zq =3D to_ap_queue(dev)->private;
a17becc112535b Harald Freudenberger 2019-08-30  337  =

a17becc112535b Harald Freudenberger 2019-08-30  338  	memset(&di, 0, sizeof=
(di));
a17becc112535b Harald Freudenberger 2019-08-30  339  =

a17becc112535b Harald Freudenberger 2019-08-30  340  	if (zq->online)
a17becc112535b Harald Freudenberger 2019-08-30  341  		ep11_get_domain_info=
(AP_QID_CARD(zq->queue->qid),
a17becc112535b Harald Freudenberger 2019-08-30  342  				     AP_QID_QUEUE(=
zq->queue->qid),
a17becc112535b Harald Freudenberger 2019-08-30  343  				     &di);
a17becc112535b Harald Freudenberger 2019-08-30  344  =

a17becc112535b Harald Freudenberger 2019-08-30  345  	for (i =3D 0; ep11_op=
_modes[i].mode_txt; i++) {
a17becc112535b Harald Freudenberger 2019-08-30 @346  		if (di.op_mode & (1 =
<< ep11_op_modes[i].mode_bit)) {
                                                                    ^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same.

a17becc112535b Harald Freudenberger 2019-08-30  347  			if (n > 0)
a17becc112535b Harald Freudenberger 2019-08-30  348  				buf[n++] =3D ' ';
a17becc112535b Harald Freudenberger 2019-08-30  349  			n +=3D snprintf(buf=
 + n, PAGE_SIZE - n,
a17becc112535b Harald Freudenberger 2019-08-30  350  				      "%s", ep11_o=
p_modes[i].mode_txt);
a17becc112535b Harald Freudenberger 2019-08-30  351  		}
a17becc112535b Harald Freudenberger 2019-08-30  352  	}
a17becc112535b Harald Freudenberger 2019-08-30  353  	n +=3D snprintf(buf +=
 n, PAGE_SIZE - n, "\n");
a17becc112535b Harald Freudenberger 2019-08-30  354  =

a17becc112535b Harald Freudenberger 2019-08-30  355  	return n;
a17becc112535b Harald Freudenberger 2019-08-30  356  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============6915068465445179284==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6915068465445179284==--

