Content-Type: multipart/mixed; boundary="===============5949454638396866970=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cel:topic-rpc-with-tls-upcall 3/19] net/tls/af_tlsh.c:100:52: warning: Parameter 'net' can be declared with const [constParameter]
Date: Mon, 30 May 2022 09:03:59 +0800
Message-ID: <202205300838.RhsBELII-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5949454638396866970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-w=
ith-tls-upcall
head:   b1c8574490c25c8b5bade67796641a449badc818
commit: 47ebadbb7c8a9c6329f485ed254c38350492727b [3/19] net/tls: Add suppor=
t for PF_TLSH (a TLS handshake listener)
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 47ebadbb7c8a9c6329f485ed254c38350492727b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/tls/af_tlsh.c:100:52: warning: Parameter 'net' can be declared with =
const [constParameter]
   static struct sock *tlsh_find_listener(struct net *net, unsigned short f=
amily)
                                                      ^

vim +/net +100 net/tls/af_tlsh.c

47ebadbb7c8a9c Chuck Lever 2021-11-19   90  =

47ebadbb7c8a9c Chuck Lever 2021-11-19   91  /**
47ebadbb7c8a9c Chuck Lever 2021-11-19   92   * tlsh_find_listener - find li=
stener that matches an incoming connection
47ebadbb7c8a9c Chuck Lever 2021-11-19   93   * @net: net namespace to match
47ebadbb7c8a9c Chuck Lever 2021-11-19   94   * @family: address family to m=
atch
47ebadbb7c8a9c Chuck Lever 2021-11-19   95   *
47ebadbb7c8a9c Chuck Lever 2021-11-19   96   * Return values:
47ebadbb7c8a9c Chuck Lever 2021-11-19   97   *   On success, address of a l=
istening AF_TLSH socket
47ebadbb7c8a9c Chuck Lever 2021-11-19   98   *   %NULL: No matching listene=
r found
47ebadbb7c8a9c Chuck Lever 2021-11-19   99   */
47ebadbb7c8a9c Chuck Lever 2021-11-19 @100  static struct sock *tlsh_find_l=
istener(struct net *net, unsigned short family)
47ebadbb7c8a9c Chuck Lever 2021-11-19  101  {
47ebadbb7c8a9c Chuck Lever 2021-11-19  102  	struct sock *listener;
47ebadbb7c8a9c Chuck Lever 2021-11-19  103  =

47ebadbb7c8a9c Chuck Lever 2021-11-19  104  	read_lock(&tlsh_listener_lock);
47ebadbb7c8a9c Chuck Lever 2021-11-19  105  =

47ebadbb7c8a9c Chuck Lever 2021-11-19  106  	sk_for_each(listener, &tlsh_li=
steners) {
47ebadbb7c8a9c Chuck Lever 2021-11-19  107  		if (sock_net(listener) !=3D n=
et)
47ebadbb7c8a9c Chuck Lever 2021-11-19  108  			continue;
47ebadbb7c8a9c Chuck Lever 2021-11-19  109  		if (tlsh_sk(listener)->th_bin=
d_family !=3D AF_UNSPEC &&
47ebadbb7c8a9c Chuck Lever 2021-11-19  110  		    tlsh_sk(listener)->th_bin=
d_family !=3D family)
47ebadbb7c8a9c Chuck Lever 2021-11-19  111  			continue;
47ebadbb7c8a9c Chuck Lever 2021-11-19  112  =

47ebadbb7c8a9c Chuck Lever 2021-11-19  113  		sock_hold(listener);	/* Ref: =
C */
47ebadbb7c8a9c Chuck Lever 2021-11-19  114  		goto out;
47ebadbb7c8a9c Chuck Lever 2021-11-19  115  	}
47ebadbb7c8a9c Chuck Lever 2021-11-19  116  	listener =3D NULL;
47ebadbb7c8a9c Chuck Lever 2021-11-19  117  =

47ebadbb7c8a9c Chuck Lever 2021-11-19  118  out:
47ebadbb7c8a9c Chuck Lever 2021-11-19  119  	read_unlock(&tlsh_listener_loc=
k);
47ebadbb7c8a9c Chuck Lever 2021-11-19  120  	return listener;
47ebadbb7c8a9c Chuck Lever 2021-11-19  121  }
47ebadbb7c8a9c Chuck Lever 2021-11-19  122  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5949454638396866970==--

