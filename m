Content-Type: multipart/mixed; boundary="===============5456730203746264333=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/afs/fsclient.c:1674:50: warning: use of uninitialized value 'count' [CWE-457]
Date: Wed, 03 Aug 2022 09:05:47 +0800
Message-ID: <202208030916.T0KrSrmK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5456730203746264333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/afs/fs=
client.c:1674:50: warning: use of uninitialized value 'count' [CWE-457] [-W=
analyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Marc Dionne <marc.dionne@auristor.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   569bede0cff5e98c0f862d486406b79dcada8eea
commit: b537a3c21775075395af475dcc6ef212fcf29db8 afs: Fix corruption in rea=
ds at fpos 2G-4G from an OpenAFS server
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220803/202208030916.T0KrSrmK-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db537a3c21775075395af475dcc6ef212fcf29db8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b537a3c21775075395af475dcc6ef212fcf29db8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/afs/fsclient.c: In function 'afs_deliver_fs_fetch_data':
   fs/afs/fsclient.c:305:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     305 |         const __be32 *bp;
         |                       ^~
     'afs_deliver_fs_fetch_data': event 1
       |
       |  305 |         const __be32 *bp;
       |      |                       ^~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   fs/afs/fsclient.c: In function 'afs_fs_setattr_size64':
   fs/afs/fsclient.c:1180:17: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1180 |         __be32 *bp;
         |                 ^~
     'afs_fs_setattr_size64': event 1
       |
       | 1180 |         __be32 *bp;
       |      |                 ^~
       |      |                 |
       |      |                 (1) use of uninitialized value '<unknown>' =
here
       |
   fs/afs/fsclient.c: In function 'afs_fs_setattr_size':
   fs/afs/fsclient.c:1222:17: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1222 |         __be32 *bp;
         |                 ^~
     'afs_fs_setattr_size': event 1
       |
       | 1222 |         __be32 *bp;
       |      |                 ^~
       |      |                 |
       |      |                 (1) use of uninitialized value '<unknown>' =
here
       |
   fs/afs/fsclient.c: In function 'afs_fs_setattr':
   fs/afs/fsclient.c:1263:17: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1263 |         __be32 *bp;
         |                 ^~
     'afs_fs_setattr': event 1
       |
       | 1263 |         __be32 *bp;
       |      |                 ^~
       |      |                 |
       |      |                 (1) use of uninitialized value '<unknown>' =
here
       |
   fs/afs/fsclient.c: In function 'afs_deliver_fs_get_volume_status':
   fs/afs/fsclient.c:1296:23: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1296 |         const __be32 *bp;
         |                       ^~
     'afs_deliver_fs_get_volume_status': event 1
       |
       | 1296 |         const __be32 *bp;
       |      |                       ^~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   fs/afs/fsclient.c: In function 'afs_deliver_fs_get_capabilities':
>> fs/afs/fsclient.c:1674:50: warning: use of uninitialized value 'count' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1674 |                 afs_extract_discard(call, (count - 1) * sizeof(_=
_be32));
         |                                           ~~~~~~~^~~~
     'afs_deliver_fs_get_capabilities': events 1-6
       |
       | 1638 |         u32 count;
       |      |             ^~~~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       | 1643 |         switch (call->unmarshall) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 2:' branch...
       |......
       | 1669 |         case 2:
       |      |         ~~~~ =

       |      |         |
       |      |         (3) ...to here
       | 1670 |                 ret =3D afs_extract_data(call, false);
       | 1671 |                 if (ret < 0)
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'false' branch (when 'ret =
>=3D 0')...
       |......
       | 1674 |                 afs_extract_discard(call, (count - 1) * siz=
eof(__be32));
       |      |                                           ~~~~~~~~~~~
       |      |                                                  |
       |      |                                                  (5) ...to =
here
       |      |                                                  (6) use of=
 uninitialized value 'count' here
       |
   fs/afs/fsclient.c: In function 'afs_deliver_fs_inline_bulk_status':
   fs/afs/fsclient.c:1744:23: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1744 |         const __be32 *bp;
         |                       ^~
     'afs_deliver_fs_inline_bulk_status': event 1
       |
       | 1744 |         const __be32 *bp;
       |      |                       ^~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   fs/afs/fsclient.c: In function 'afs_deliver_fs_fetch_acl':
   fs/afs/fsclient.c:1943:23: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1943 |         const __be32 *bp;
         |                       ^~
     'afs_deliver_fs_fetch_acl': event 1
       |
       | 1943 |         const __be32 *bp;
       |      |                       ^~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |

vim +/count +1674 fs/afs/fsclient.c

d2ddc776a4581d David Howells       2017-11-02  1632  =

d2ddc776a4581d David Howells       2017-11-02  1633  /*
d2ddc776a4581d David Howells       2017-11-02  1634   * Deliver reply data =
to an FS.GetCapabilities operation.
d2ddc776a4581d David Howells       2017-11-02  1635   */
d2ddc776a4581d David Howells       2017-11-02  1636  static int afs_deliver=
_fs_get_capabilities(struct afs_call *call)
d2ddc776a4581d David Howells       2017-11-02  1637  {
d2ddc776a4581d David Howells       2017-11-02  1638  	u32 count;
d2ddc776a4581d David Howells       2017-11-02  1639  	int ret;
d2ddc776a4581d David Howells       2017-11-02  1640  =

fc276122496df1 David Howells       2019-11-21  1641  	_enter("{%u,%zu}", ca=
ll->unmarshall, iov_iter_count(call->iter));
d2ddc776a4581d David Howells       2017-11-02  1642  =

d2ddc776a4581d David Howells       2017-11-02  1643  	switch (call->unmarsh=
all) {
d2ddc776a4581d David Howells       2017-11-02  1644  	case 0:
12bdcf333fe13e David Howells       2018-10-20  1645  		afs_extract_to_tmp(c=
all);
d2ddc776a4581d David Howells       2017-11-02  1646  		call->unmarshall++;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  1647  		fallthrough;
d2ddc776a4581d David Howells       2017-11-02  1648  =

2988160827b780 Gustavo A. R. Silva 2019-05-19  1649  		/* Extract the capab=
ilities word count */
d2ddc776a4581d David Howells       2017-11-02  1650  	case 1:
12bdcf333fe13e David Howells       2018-10-20  1651  		ret =3D afs_extract_=
data(call, true);
d2ddc776a4581d David Howells       2017-11-02  1652  		if (ret < 0)
d2ddc776a4581d David Howells       2017-11-02  1653  			return ret;
d2ddc776a4581d David Howells       2017-11-02  1654  =

d2ddc776a4581d David Howells       2017-11-02  1655  		count =3D ntohl(call=
->tmp);
d2ddc776a4581d David Howells       2017-11-02  1656  		call->count =3D coun=
t;
d2ddc776a4581d David Howells       2017-11-02  1657  		call->count2 =3D cou=
nt;
b537a3c2177507 David Howells       2021-09-10  1658  		if (count =3D=3D 0) {
b537a3c2177507 David Howells       2021-09-10  1659  			call->unmarshall =
=3D 4;
b537a3c2177507 David Howells       2021-09-10  1660  			call->tmp =3D 0;
b537a3c2177507 David Howells       2021-09-10  1661  			break;
b537a3c2177507 David Howells       2021-09-10  1662  		}
b537a3c2177507 David Howells       2021-09-10  1663  =

b537a3c2177507 David Howells       2021-09-10  1664  		/* Extract the first=
 word of the capabilities to call->tmp */
b537a3c2177507 David Howells       2021-09-10  1665  		afs_extract_to_tmp(c=
all);
d2ddc776a4581d David Howells       2017-11-02  1666  		call->unmarshall++;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  1667  		fallthrough;
d2ddc776a4581d David Howells       2017-11-02  1668  =

d2ddc776a4581d David Howells       2017-11-02  1669  	case 2:
12bdcf333fe13e David Howells       2018-10-20  1670  		ret =3D afs_extract_=
data(call, false);
d2ddc776a4581d David Howells       2017-11-02  1671  		if (ret < 0)
d2ddc776a4581d David Howells       2017-11-02  1672  			return ret;
d2ddc776a4581d David Howells       2017-11-02  1673  =

b537a3c2177507 David Howells       2021-09-10 @1674  		afs_extract_discard(=
call, (count - 1) * sizeof(__be32));
b537a3c2177507 David Howells       2021-09-10  1675  		call->unmarshall++;
b537a3c2177507 David Howells       2021-09-10  1676  		fallthrough;
b537a3c2177507 David Howells       2021-09-10  1677  =

b537a3c2177507 David Howells       2021-09-10  1678  		/* Extract remaining=
 capabilities words */
b537a3c2177507 David Howells       2021-09-10  1679  	case 3:
b537a3c2177507 David Howells       2021-09-10  1680  		ret =3D afs_extract_=
data(call, false);
b537a3c2177507 David Howells       2021-09-10  1681  		if (ret < 0)
b537a3c2177507 David Howells       2021-09-10  1682  			return ret;
d2ddc776a4581d David Howells       2017-11-02  1683  =

d2ddc776a4581d David Howells       2017-11-02  1684  		call->unmarshall++;
d2ddc776a4581d David Howells       2017-11-02  1685  		break;
d2ddc776a4581d David Howells       2017-11-02  1686  	}
d2ddc776a4581d David Howells       2017-11-02  1687  =

d2ddc776a4581d David Howells       2017-11-02  1688  	_leave(" =3D 0 [done]=
");
d2ddc776a4581d David Howells       2017-11-02  1689  	return 0;
d2ddc776a4581d David Howells       2017-11-02  1690  }
d2ddc776a4581d David Howells       2017-11-02  1691  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5456730203746264333==--

