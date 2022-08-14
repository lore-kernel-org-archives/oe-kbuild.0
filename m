Content-Type: multipart/mixed; boundary="===============1082111873540977923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/s390/net/qeth_core_main.c:4644 qeth_snmp_command() error: copy_from_user() '&__ipa_cmd(iob)->data.setadapterparms.data.snmp' too small (37 vs 4096)
Date: Sun, 14 Aug 2022 09:12:59 +0800
Message-ID: <202208140946.0cNI19p8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1082111873540977923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f6eb0fed6a3957c0b93e3a00c1ffaad84d4ffc31
commit: 454ede3f1424c36bc124f8d7ed4b3ea654654be1 s390/uaccess: use exceptio=
n handler to zero result on get_user() failure
date:   2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 months ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220814/202208140946.0cNI19p8-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/s390/net/qeth_core_main.c:4644 qeth_snmp_command() error: copy_from=
_user() '&__ipa_cmd(iob)->data.setadapterparms.data.snmp' too small (37 vs =
4096)

Old smatch warnings:
drivers/s390/net/qeth_core_main.c:2760 qeth_print_status_message() warn: ar=
gument 3 to %02x specifier has type 'char'
drivers/s390/net/qeth_core_main.c:2760 qeth_print_status_message() warn: ar=
gument 4 to %02x specifier has type 'char'

vim +4644 drivers/s390/net/qeth_core_main.c

4a71df50047f0d Frank Blaschka  2008-02-15  4613  =

942d6984aa0cb3 Julian Wiedmann 2017-04-11  4614  static int qeth_snmp_comma=
nd(struct qeth_card *card, char __user *udata)
4a71df50047f0d Frank Blaschka  2008-02-15  4615  {
d4c08afafa0469 Julian Wiedmann 2019-06-27  4616  	struct qeth_snmp_ureq __u=
ser *ureq;
4a71df50047f0d Frank Blaschka  2008-02-15  4617  	struct qeth_cmd_buffer *i=
ob;
6fb392b1a63ae3 Ursula Braun    2013-11-06  4618  	unsigned int req_len;
4a71df50047f0d Frank Blaschka  2008-02-15  4619  	struct qeth_arp_query_inf=
o qinfo =3D {0, };
4a71df50047f0d Frank Blaschka  2008-02-15  4620  	int rc =3D 0;
4a71df50047f0d Frank Blaschka  2008-02-15  4621  =

847a50fd9f3d6a Carsten Otte    2010-06-21  4622  	QETH_CARD_TEXT(card, 3, "=
snmpcmd");
4a71df50047f0d Frank Blaschka  2008-02-15  4623  =

379ac99e5192f9 Julian Wiedmann 2019-04-25  4624  	if (IS_VM_NIC(card))
4a71df50047f0d Frank Blaschka  2008-02-15  4625  		return -EOPNOTSUPP;
4a71df50047f0d Frank Blaschka  2008-02-15  4626  =

4a71df50047f0d Frank Blaschka  2008-02-15  4627  	if ((!qeth_adp_supported(=
card, IPA_SETADP_SET_SNMP_CONTROL)) &&
4fda33547676e2 Julian Wiedmann 2018-09-26  4628  	    IS_LAYER3(card))
4a71df50047f0d Frank Blaschka  2008-02-15  4629  		return -EOPNOTSUPP;
4fda33547676e2 Julian Wiedmann 2018-09-26  4630  =

d4c08afafa0469 Julian Wiedmann 2019-06-27  4631  	ureq =3D (struct qeth_snm=
p_ureq __user *) udata;
d4c08afafa0469 Julian Wiedmann 2019-06-27  4632  	if (get_user(qinfo.udata_=
len, &ureq->hdr.data_len) ||
d4c08afafa0469 Julian Wiedmann 2019-06-27  4633  	    get_user(req_len, &ur=
eq->hdr.req_len))
d4c08afafa0469 Julian Wiedmann 2019-06-27  4634  		return -EFAULT;
d4c08afafa0469 Julian Wiedmann 2019-06-27  4635  =

292a50e3fc2cf6 Julian Wiedmann 2019-08-23  4636  	/* Sanitize user input, t=
o avoid overflows in iob size calculation: */
292a50e3fc2cf6 Julian Wiedmann 2019-08-23  4637  	if (req_len > QETH_BUFSIZ=
E)
292a50e3fc2cf6 Julian Wiedmann 2019-08-23  4638  		return -EINVAL;
292a50e3fc2cf6 Julian Wiedmann 2019-08-23  4639  =

d4c08afafa0469 Julian Wiedmann 2019-06-27  4640  	iob =3D qeth_get_adapter_=
cmd(card, IPA_SETADP_SET_SNMP_CONTROL, req_len);
d4c08afafa0469 Julian Wiedmann 2019-06-27  4641  	if (!iob)
d4c08afafa0469 Julian Wiedmann 2019-06-27  4642  		return -ENOMEM;
d4c08afafa0469 Julian Wiedmann 2019-06-27  4643  =

d4c08afafa0469 Julian Wiedmann 2019-06-27 @4644  	if (copy_from_user(&__ipa=
_cmd(iob)->data.setadapterparms.data.snmp,
d4c08afafa0469 Julian Wiedmann 2019-06-27  4645  			   &ureq->cmd, req_len)=
) {
d4c08afafa0469 Julian Wiedmann 2019-06-27  4646  		qeth_put_cmd(iob);
4a71df50047f0d Frank Blaschka  2008-02-15  4647  		return -EFAULT;
4a71df50047f0d Frank Blaschka  2008-02-15  4648  	}
d4c08afafa0469 Julian Wiedmann 2019-06-27  4649  =

4a71df50047f0d Frank Blaschka  2008-02-15  4650  	qinfo.udata =3D kzalloc(q=
info.udata_len, GFP_KERNEL);
4a71df50047f0d Frank Blaschka  2008-02-15  4651  	if (!qinfo.udata) {
d4c08afafa0469 Julian Wiedmann 2019-06-27  4652  		qeth_put_cmd(iob);
4a71df50047f0d Frank Blaschka  2008-02-15  4653  		return -ENOMEM;
4a71df50047f0d Frank Blaschka  2008-02-15  4654  	}
4a71df50047f0d Frank Blaschka  2008-02-15  4655  	qinfo.udata_offset =3D si=
zeof(struct qeth_snmp_ureq_hdr);
4a71df50047f0d Frank Blaschka  2008-02-15  4656  =

c21532771e9f96 Julian Wiedmann 2019-02-12  4657  	rc =3D qeth_send_ipa_cmd(=
card, iob, qeth_snmp_command_cb, &qinfo);
4a71df50047f0d Frank Blaschka  2008-02-15  4658  	if (rc)
e19e5be8b4cafa Julian Wiedmann 2018-11-02  4659  		QETH_DBF_MESSAGE(2, "SNM=
P command failed on device %x: (%#x)\n",
e19e5be8b4cafa Julian Wiedmann 2018-11-02  4660  				 CARD_DEVID(card), rc);
4a71df50047f0d Frank Blaschka  2008-02-15  4661  	else {
4a71df50047f0d Frank Blaschka  2008-02-15  4662  		if (copy_to_user(udata, =
qinfo.udata, qinfo.udata_len))
4a71df50047f0d Frank Blaschka  2008-02-15  4663  			rc =3D -EFAULT;
4a71df50047f0d Frank Blaschka  2008-02-15  4664  	}
d4c08afafa0469 Julian Wiedmann 2019-06-27  4665  =

4a71df50047f0d Frank Blaschka  2008-02-15  4666  	kfree(qinfo.udata);
4a71df50047f0d Frank Blaschka  2008-02-15  4667  	return rc;
4a71df50047f0d Frank Blaschka  2008-02-15  4668  }
4a71df50047f0d Frank Blaschka  2008-02-15  4669  =


:::::: The code at line 4644 was first introduced by commit
:::::: d4c08afafa0469a24771b14528ee179f72861ea3 s390/qeth: streamline SNMP =
cmd code

:::::: TO: Julian Wiedmann <jwi@linux.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1082111873540977923==--

