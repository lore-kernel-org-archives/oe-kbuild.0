Content-Type: multipart/mixed; boundary="===============0879022189432929739=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_sock.c:941 hci_sock_bound_ioctl() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 26 Nov 2021 14:02:59 +0800
Message-ID: <202111261412.7EyejQRm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0879022189432929739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: e04480920d1eec9c061841399aa6f35b6f987d8b Bluetooth: defer cleanup o=
f resources in hci_unregister_dev()
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20211123 (https://download.01.org/0day-ci/=
archive/20211126/202111261412.7EyejQRm-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/hci_sock.c:941 hci_sock_bound_ioctl() warn: passing a valid p=
ointer to 'PTR_ERR'
net/bluetooth/hci_sock.c:1401 hci_sock_getname() warn: passing a valid poin=
ter to 'PTR_ERR'
net/bluetooth/hci_sock.c:1765 hci_sock_sendmsg() warn: passing a valid poin=
ter to 'PTR_ERR'

Old smatch warnings:
net/bluetooth/hci_sock.c:1535 hci_mgmt_cmd() warn: is 'buf' large enough fo=
r 'struct mgmt_hdr'? s32min

vim +/PTR_ERR +941 net/bluetooth/hci_sock.c

f03585689fdff4 Johan Hedberg   2010-05-18  933  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  934  /* Ioctls that require boun=
d socket */
6039aa73a1323e Gustavo Padovan 2012-05-23  935  static int hci_sock_bound_i=
octl(struct sock *sk, unsigned int cmd,
6039aa73a1323e Gustavo Padovan 2012-05-23  936  				unsigned long arg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  937  {
e04480920d1eec Tetsuo Handa    2021-08-04  938  	struct hci_dev *hdev =3D h=
ci_hdev_from_sock(sk);
^1da177e4c3f41 Linus Torvalds  2005-04-16  939  =

e04480920d1eec Tetsuo Handa    2021-08-04  940  	if (IS_ERR(hdev))
e04480920d1eec Tetsuo Handa    2021-08-04 @941  		return PTR_ERR(hdev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  942  =

d7a5a11d7fa80b Marcel Holtmann 2015-03-13  943  	if (hci_dev_test_flag(hdev=
, HCI_USER_CHANNEL))
0736cfa8e5bb7e Marcel Holtmann 2013-08-26  944  		return -EBUSY;
0736cfa8e5bb7e Marcel Holtmann 2013-08-26  945  =

d7a5a11d7fa80b Marcel Holtmann 2015-03-13  946  	if (hci_dev_test_flag(hdev=
, HCI_UNCONFIGURED))
fee746b0babf12 Marcel Holtmann 2014-06-29  947  		return -EOPNOTSUPP;
fee746b0babf12 Marcel Holtmann 2014-06-29  948  =

ca8bee5dde1f02 Marcel Holtmann 2016-07-05  949  	if (hdev->dev_type !=3D HC=
I_PRIMARY)
5b69bef5413188 Marcel Holtmann 2013-10-10  950  		return -EOPNOTSUPP;
5b69bef5413188 Marcel Holtmann 2013-10-10  951  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  952  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  953  	case HCISETRAW:
^1da177e4c3f41 Linus Torvalds  2005-04-16  954  		if (!capable(CAP_NET_ADMI=
N))
bf5b30b8a4416d Zhao Hongjiang  2012-09-20  955  			return -EPERM;
db5966816cd83b Marcel Holtmann 2014-04-16  956  		return -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds  2005-04-16  957  =

^1da177e4c3f41 Linus Torvalds  2005-04-16  958  	case HCIGETCONNINFO:
^1da177e4c3f41 Linus Torvalds  2005-04-16  959  		return hci_get_conn_info(=
hdev, (void __user *)arg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  960  =

40be492fe4fab8 Marcel Holtmann 2008-07-14  961  	case HCIGETAUTHINFO:
40be492fe4fab8 Marcel Holtmann 2008-07-14  962  		return hci_get_auth_info(=
hdev, (void __user *)arg);
40be492fe4fab8 Marcel Holtmann 2008-07-14  963  =

f03585689fdff4 Johan Hedberg   2010-05-18  964  	case HCIBLOCKADDR:
f03585689fdff4 Johan Hedberg   2010-05-18  965  		if (!capable(CAP_NET_ADMI=
N))
bf5b30b8a4416d Zhao Hongjiang  2012-09-20  966  			return -EPERM;
3d4f9c00492b4e Archie Pusaka   2021-06-04  967  		return hci_sock_reject_li=
st_add(hdev, (void __user *)arg);
f03585689fdff4 Johan Hedberg   2010-05-18  968  =

f03585689fdff4 Johan Hedberg   2010-05-18  969  	case HCIUNBLOCKADDR:
f03585689fdff4 Johan Hedberg   2010-05-18  970  		if (!capable(CAP_NET_ADMI=
N))
bf5b30b8a4416d Zhao Hongjiang  2012-09-20  971  			return -EPERM;
3d4f9c00492b4e Archie Pusaka   2021-06-04  972  		return hci_sock_reject_li=
st_del(hdev, (void __user *)arg);
0736cfa8e5bb7e Marcel Holtmann 2013-08-26  973  	}
f03585689fdff4 Johan Hedberg   2010-05-18  974  =

324d36ed26a22b Marcel Holtmann 2013-10-10  975  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds  2005-04-16  976  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  977  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0879022189432929739==--

