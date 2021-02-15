Content-Type: multipart/mixed; boundary="===============1169047119300774152=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [net-next] tcp: Sanitize CMSG flags and reserved args in tcp_zerocopy_receive.
Date: Mon, 15 Feb 2021 19:02:22 +0300
Message-ID: <20210215160222.GE2222@kadam>
In-Reply-To: <33d68f94-2d20-fdc4-c572-16138aa6305b@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1169047119300774152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 08:04:11AM -0700, David Ahern wrote:
> On 2/15/21 5:03 AM, Dan Carpenter wrote:
> > Hi Arjun,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Arjun-Roy/tcp-Sanitize=
-CMSG-flags-and-reserved-args-in-tcp_zerocopy_receive/20210212-052537 =

> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.=
git  e4b62cf7559f2ef9a022de235e5a09a8d7ded520
> > config: x86_64-randconfig-m001-20210209 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > net/ipv4/tcp.c:4158 do_tcp_getsockopt() warn: check for integer overflo=
w 'len'
> > =

> > vim +/len +4158 net/ipv4/tcp.c
> > =

> > 3fdadf7d27e3fb Dmitry Mishin            2006-03-20  3896  static int do=
_tcp_getsockopt(struct sock *sk, int level,
> > 3fdadf7d27e3fb Dmitry Mishin            2006-03-20  3897  		int optname=
, char __user *optval, int __user *optlen)
> > ^1da177e4c3f41 Linus Torvalds           2005-04-16  3898  {
> > 295f7324ff8d9e Arnaldo Carvalho de Melo 2005-08-09  3899  	struct inet_=
connection_sock *icsk =3D inet_csk(sk);
> > ^1da177e4c3f41 Linus Torvalds           2005-04-16  3900  	struct tcp_s=
ock *tp =3D tcp_sk(sk);
> > 6fa251663069e0 Nikolay Borisov          2016-02-03  3901  	struct net *=
net =3D sock_net(sk);
> > ^1da177e4c3f41 Linus Torvalds           2005-04-16  3902  	int val, len;
> > =

> > "len" is int.
> > =

> > [ snip ]
> > 05255b823a6173 Eric Dumazet             2018-04-27  4146  #ifdef CONFIG=
_MMU
> > 05255b823a6173 Eric Dumazet             2018-04-27  4147  	case TCP_ZER=
OCOPY_RECEIVE: {
> > 7eeba1706eba6d Arjun Roy                2021-01-20  4148  		struct scm_=
timestamping_internal tss;
> > e0fecb289ad3fd Arjun Roy                2020-12-10  4149  		struct tcp_=
zerocopy_receive zc =3D {};
> > 05255b823a6173 Eric Dumazet             2018-04-27  4150  		int err;
> > 05255b823a6173 Eric Dumazet             2018-04-27  4151  =

> > 05255b823a6173 Eric Dumazet             2018-04-27  4152  		if (get_use=
r(len, optlen))
> > 05255b823a6173 Eric Dumazet             2018-04-27  4153  			return -EF=
AULT;
> > c8856c05145490 Arjun Roy                2020-02-14  4154  		if (len < o=
ffsetofend(struct tcp_zerocopy_receive, length))
> > 05255b823a6173 Eric Dumazet             2018-04-27  4155  			return -EI=
NVAL;
> > =

> > =

> > The problem is that negative values of "len" are type promoted to high
> > positive values.  So the fix is to write this as:
> > =

> > 	if (len < 0 || len < offsetofend(struct tcp_zerocopy_receive, length))
> > 		return -EINVAL;
> > =

> > 110912bdf28392 Arjun Roy                2021-02-11  4156  		if (unlikel=
y(len > sizeof(zc))) {
> > 110912bdf28392 Arjun Roy                2021-02-11  4157  			err =3D ch=
eck_zeroed_user(optval + sizeof(zc),
> > 110912bdf28392 Arjun Roy                2021-02-11 @4158  						len - s=
izeof(zc));
> >                                                                        =
                                 ^^^^^^^^^^^^^^^^
> > Potentially "len - a negative value".
> > =

> > =

> =

> get_user(len, optlen) is called multiple times in that function. len < 0
> was checked after the first one at the top.
> =


What you're describing is a "Double Fetch" bug, where the attack is we
get some data from the user, and we verify it, then we get it from the
user a second time and trust it.  The problem is that the user modifies
it between the first and second get_user() call so it ends up being a
security vulnerability.

But I'm glad you pointed out the first get_user() because it has an
ancient, harmless pre git bug in it.

net/ipv4/tcp.c
  3888  static int do_tcp_getsockopt(struct sock *sk, int level,
  3889                  int optname, char __user *optval, int __user *optle=
n)
  3890  {
  3891          struct inet_connection_sock *icsk =3D inet_csk(sk);
  3892          struct tcp_sock *tp =3D tcp_sk(sk);
  3893          struct net *net =3D sock_net(sk);
  3894          int val, len;
  3895  =

  3896          if (get_user(len, optlen))
  3897                  return -EFAULT;
  3898  =

  3899          len =3D min_t(unsigned int, len, sizeof(int));
  3900  =

  3901          if (len < 0)
                    ^^^^^^^
This is impossible.  "len" has to be in the 0-4 range because of the
min_t() assignment.  It's harmless though and the condition should just
be removed.

  3902                  return -EINVAL;
  3903  =

  3904          switch (optname) {
  3905          case TCP_MAXSEG:

Anyway, I will create a new Smatch warning for this situation.

> Also, maybe I am missing something here, but offsetofend can not return
> a negative value, so this checks catches len < 0 as well:
> =

> 	if (len < offsetofend(struct tcp_zerocopy_receive, length))
> 		return -EINVAL;
> =


offsetofend is (unsigned long)12.  If we compare a negative integer with
(unsigned long)12 then negative number is type promoted to a high
positive value.

	if (-1 < (usigned long)12)
		printf("dan is wrong\n");

regards,
dan carpenter


--===============1169047119300774152==--

