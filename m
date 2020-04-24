Content-Type: multipart/mixed; boundary="===============3687583271644769084=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [net-next:master 43/63] net/qrtr/ns.c:111:47: sparse: expected restricted __le32 [usertype] service
Date: Fri, 24 Apr 2020 13:52:19 +0800
Message-ID: <202004241316.nZeymbLP%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3687583271644769084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: netdev(a)vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   1802136023c010759d9ed1ff2b6384bcbf5eb3f9
commit: dfddb54043f0a377f642bd0e6a28aa40769e2e65 [43/63] net: qrtr: Add tra=
cepoint support
reproduce:
        # apt-get install sparse
        # sparse version: =

        git checkout dfddb54043f0a377f642bd0e6a28aa40769e2e65
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 4 hours ago
:::::: commit date: 34 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:11:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:37:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: cast to restricted __=
le32
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   include/trace/events/qrtr.h:63:1: sparse: warning: restricted __le32 deg=
rades to integer
   net/qrtr/ns.c:111:47: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
>> net/qrtr/ns.c:111:47: sparse:    expected restricted __le32 [usertype] s=
ervice
>> net/qrtr/ns.c:111:47: sparse:    got unsigned int service
   net/qrtr/ns.c:111:61: sparse: warning: incorrect type in argument 2 (dif=
ferent base types)
>> net/qrtr/ns.c:111:61: sparse:    expected restricted __le32 [usertype] i=
nstance
>> net/qrtr/ns.c:111:61: sparse:    got unsigned int instance
   net/qrtr/ns.c:112:47: sparse: warning: incorrect type in argument 3 (dif=
ferent base types)
>> net/qrtr/ns.c:112:47: sparse:    expected restricted __le32 [usertype] n=
ode
>> net/qrtr/ns.c:112:47: sparse:    got unsigned int node
   net/qrtr/ns.c:112:58: sparse: warning: incorrect type in argument 4 (dif=
ferent base types)
>> net/qrtr/ns.c:112:58: sparse:    expected restricted __le32 [usertype] p=
ort
>> net/qrtr/ns.c:112:58: sparse:    got unsigned int port
   net/qrtr/ns.c:138:47: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
   net/qrtr/ns.c:138:47: sparse:    expected restricted __le32 [usertype] s=
ervice
   net/qrtr/ns.c:138:47: sparse:    got unsigned int service
   net/qrtr/ns.c:138:61: sparse: warning: incorrect type in argument 2 (dif=
ferent base types)
   net/qrtr/ns.c:138:61: sparse:    expected restricted __le32 [usertype] i=
nstance
   net/qrtr/ns.c:138:61: sparse:    got unsigned int instance
   net/qrtr/ns.c:139:47: sparse: warning: incorrect type in argument 3 (dif=
ferent base types)
   net/qrtr/ns.c:139:47: sparse:    expected restricted __le32 [usertype] n=
ode
   net/qrtr/ns.c:139:47: sparse:    got unsigned int node
   net/qrtr/ns.c:139:58: sparse: warning: incorrect type in argument 4 (dif=
ferent base types)
   net/qrtr/ns.c:139:58: sparse:    expected restricted __le32 [usertype] p=
ort
   net/qrtr/ns.c:139:58: sparse:    got unsigned int port
   net/qrtr/ns.c:250:37: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
   net/qrtr/ns.c:250:37: sparse:    expected restricted __le32 [usertype] s=
ervice
   net/qrtr/ns.c:250:37: sparse:    got unsigned int service
   net/qrtr/ns.c:250:51: sparse: warning: incorrect type in argument 2 (dif=
ferent base types)
   net/qrtr/ns.c:250:51: sparse:    expected restricted __le32 [usertype] i=
nstance
   net/qrtr/ns.c:250:51: sparse:    got unsigned int instance
   net/qrtr/ns.c:251:37: sparse: warning: incorrect type in argument 3 (dif=
ferent base types)
   net/qrtr/ns.c:251:37: sparse:    expected restricted __le32 [usertype] n=
ode
   net/qrtr/ns.c:251:37: sparse:    got unsigned int node
   net/qrtr/ns.c:251:48: sparse: warning: incorrect type in argument 4 (dif=
ferent base types)
   net/qrtr/ns.c:251:48: sparse:    expected restricted __le32 [usertype] p=
ort
   net/qrtr/ns.c:251:48: sparse:    got unsigned int port

# https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit=
/?id=3Ddfddb54043f0a377f642bd0e6a28aa40769e2e65
git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/dav=
em/net-next.git
git remote update net-next
git checkout dfddb54043f0a377f642bd0e6a28aa40769e2e65
vim +111 net/qrtr/ns.c

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  103  =

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  104  static int service_an=
nounce_new(struct sockaddr_qrtr *dest,
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  105  				struct qrtr_serve=
r *srv)
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  106  {
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  107  	struct qrtr_ctrl_pkt=
 pkt;
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  108  	struct msghdr msg =
=3D { };
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  109  	struct kvec iv;
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  110  =

dfddb54043f0a3 Manivannan Sadhasivam 2020-04-21 @111  	trace_qrtr_ns_servic=
e_announce_new(srv->service, srv->instance,
dfddb54043f0a3 Manivannan Sadhasivam 2020-04-21 @112  					   srv->node, sr=
v->port);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  113  =

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  114  	iv.iov_base =3D &pkt;
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  115  	iv.iov_len =3D sizeo=
f(pkt);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  116  =

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  117  	memset(&pkt, 0, size=
of(pkt));
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  118  	pkt.cmd =3D cpu_to_l=
e32(QRTR_TYPE_NEW_SERVER);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  119  	pkt.server.service =
=3D cpu_to_le32(srv->service);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  120  	pkt.server.instance =
=3D cpu_to_le32(srv->instance);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  121  	pkt.server.node =3D =
cpu_to_le32(srv->node);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  122  	pkt.server.port =3D =
cpu_to_le32(srv->port);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  123  =

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  124  	msg.msg_name =3D (st=
ruct sockaddr *)dest;
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  125  	msg.msg_namelen =3D =
sizeof(*dest);
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  126  =

0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  127  	return kernel_sendms=
g(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  128  }
0c2204a4ad710d Manivannan Sadhasivam 2020-02-20  129  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3687583271644769084==--

