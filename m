Content-Type: multipart/mixed; boundary="===============1270893248949853088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trondmy-nfs-2.6:testing 4/10] net/sunrpc/xprtsock.c:1436 xs_local_state_change() error: uninitialized symbol 'transport'.
Date: Fri, 29 Apr 2022 18:13:40 +0800
Message-ID: <202204291840.vXJc8xQ6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1270893248949853088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   b44c0c653b27127aba20075ef53b0d641a36a3ae
commit: 8869b563cd42a4cb725604322454ed4fb29a0c18 [4/10] SUNRPC: Ensure time=
ly close of disconnected AF_LOCAL sockets
:::::: branch date: 11 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20429/202204291840.vXJc8xQ6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/sunrpc/xprtsock.c:1436 xs_local_state_change() error: uninitialized sym=
bol 'transport'.

vim +/transport +1436 net/sunrpc/xprtsock.c

44b98efdd0a205 Ricardo Labiaga 2009-04-01  1420  =

8869b563cd42a4 Trond Myklebust 2022-04-28  1421  /**
8869b563cd42a4 Trond Myklebust 2022-04-28  1422   * xs_local_state_change -=
 callback to handle AF_LOCAL socket state changes
8869b563cd42a4 Trond Myklebust 2022-04-28  1423   * @sk: socket whose state=
 has changed
8869b563cd42a4 Trond Myklebust 2022-04-28  1424   *
8869b563cd42a4 Trond Myklebust 2022-04-28  1425   */
8869b563cd42a4 Trond Myklebust 2022-04-28  1426  static void xs_local_state=
_change(struct sock *sk)
8869b563cd42a4 Trond Myklebust 2022-04-28  1427  {
8869b563cd42a4 Trond Myklebust 2022-04-28  1428  	struct rpc_xprt *xprt;
8869b563cd42a4 Trond Myklebust 2022-04-28  1429  	struct sock_xprt *transpo=
rt;
8869b563cd42a4 Trond Myklebust 2022-04-28  1430  =

8869b563cd42a4 Trond Myklebust 2022-04-28  1431  	if (!(xprt =3D xprt_from_=
sock(sk)))
8869b563cd42a4 Trond Myklebust 2022-04-28  1432  		return;
8869b563cd42a4 Trond Myklebust 2022-04-28  1433  	if (sk->sk_shutdown & SHU=
TDOWN_MASK) {
8869b563cd42a4 Trond Myklebust 2022-04-28  1434  		clear_bit(XPRT_CONNECTED=
, &xprt->state);
8869b563cd42a4 Trond Myklebust 2022-04-28  1435  		/* Trigger the socket re=
lease */
8869b563cd42a4 Trond Myklebust 2022-04-28 @1436  		xs_run_error_worker(tran=
sport, XPRT_SOCK_WAKE_DISCONNECT);
8869b563cd42a4 Trond Myklebust 2022-04-28  1437  	}
8869b563cd42a4 Trond Myklebust 2022-04-28  1438  }
8869b563cd42a4 Trond Myklebust 2022-04-28  1439  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1270893248949853088==--

