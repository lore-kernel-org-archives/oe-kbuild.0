Content-Type: multipart/mixed; boundary="===============6496822740387514328=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND] net: qrtr: support qrtr service and lookup route
Date: Thu, 09 Apr 2020 10:14:49 +0800
Message-ID: <202004091028.xeWZwWwR%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6496822740387514328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200408104833.6880-1-wenhu.wang@vivo.com>
References: <20200408104833.6880-1-wenhu.wang@vivo.com>
TO: Wang Wenhu <wenhu.wang@vivo.com>
CC: kernel(a)vivo.com

Hi Wang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.6]
[cannot apply to net-next/master net/master linus/master sparc-next/master =
next-20200408]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Wang-Wenhu/net-qrtr-suppor=
t-qrtr-service-and-lookup-route/20200408-234613
base:    7111951b8d4973bda27ff663f2cf18b663d15b48
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   net/qrtr/qsr.c:116:71: sparse: warning: incorrect type in argument 2 (di=
fferent base types)
>> net/qrtr/qsr.c:116:71: sparse:    expected unsigned int [usertype] node
>> net/qrtr/qsr.c:116:71: sparse:    got restricted __le32 [usertype] node
   net/qrtr/qsr.c:117:71: sparse: warning: incorrect type in argument 3 (di=
fferent base types)
>> net/qrtr/qsr.c:117:71: sparse:    expected unsigned int [usertype] port
>> net/qrtr/qsr.c:117:71: sparse:    got restricted __le32 [usertype] port
   net/qrtr/qsr.c:139:30: sparse: warning: cast from restricted __le32
   net/qrtr/qsr.c:140:31: sparse: warning: cast from restricted __le32
   net/qrtr/qsr.c:141:27: sparse: warning: cast from restricted __le32
   net/qrtr/qsr.c:142:27: sparse: warning: cast from restricted __le32
   net/qrtr/qsr.c:178:25: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:178:53: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:189:22: sparse: warning: incorrect type in assignment (di=
fferent base types)
>> net/qrtr/qsr.c:189:22: sparse:    expected restricted __le32 [usertype] =
service
>> net/qrtr/qsr.c:189:22: sparse:    got unsigned int [usertype] service
   net/qrtr/qsr.c:190:23: sparse: warning: incorrect type in assignment (di=
fferent base types)
>> net/qrtr/qsr.c:190:23: sparse:    expected restricted __le32 [usertype] =
instance
>> net/qrtr/qsr.c:190:23: sparse:    got unsigned int [usertype] instance
   net/qrtr/qsr.c:191:26: sparse: warning: incorrect type in assignment (di=
fferent base types)
>> net/qrtr/qsr.c:191:26: sparse:    expected restricted __le32 [usertype] =
node
>> net/qrtr/qsr.c:191:26: sparse:    got unsigned int [usertype] node
   net/qrtr/qsr.c:192:26: sparse: warning: incorrect type in assignment (di=
fferent base types)
>> net/qrtr/qsr.c:192:26: sparse:    expected restricted __le32 [usertype] =
port
>> net/qrtr/qsr.c:192:26: sparse:    got unsigned int [usertype] port
   net/qrtr/qsr.c:206:24: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:206:51: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:229:25: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:230:25: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:231:33: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:232:33: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:240:24: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:240:51: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:256:22: sparse: warning: incorrect type in assignment (di=
fferent base types)
   net/qrtr/qsr.c:256:22: sparse:    expected restricted __le32 [usertype] =
service
   net/qrtr/qsr.c:256:22: sparse:    got unsigned int [usertype] service
   net/qrtr/qsr.c:257:23: sparse: warning: incorrect type in assignment (di=
fferent base types)
   net/qrtr/qsr.c:257:23: sparse:    expected restricted __le32 [usertype] =
instance
   net/qrtr/qsr.c:257:23: sparse:    got unsigned int [usertype] instance
   net/qrtr/qsr.c:258:26: sparse: warning: incorrect type in assignment (di=
fferent base types)
   net/qrtr/qsr.c:258:26: sparse:    expected restricted __le32 [usertype] =
node
   net/qrtr/qsr.c:258:26: sparse:    got unsigned int [usertype] node
   net/qrtr/qsr.c:259:26: sparse: warning: incorrect type in assignment (di=
fferent base types)
   net/qrtr/qsr.c:259:26: sparse:    expected restricted __le32 [usertype] =
port
   net/qrtr/qsr.c:259:26: sparse:    got unsigned int [usertype] port
   net/qrtr/qsr.c:275:27: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:276:27: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:277:35: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:278:35: sparse: warning: restricted __le32 degrades to in=
teger
   net/qrtr/qsr.c:482:16: sparse: warning: symbol 'qsr_handle_ops' was not =
declared. Should it be static?

# https://github.com/0day-ci/linux/commit/c66a78864319437062e4d506cc771623d=
0486bae
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout c66a78864319437062e4d506cc771623d0486bae
vim +116 net/qrtr/qsr.c

c66a78864319437 Wang Wenhu 2020-04-08  102  =

c66a78864319437 Wang Wenhu 2020-04-08  103  static int qsr_new_server(struc=
t qsr_info *new)
c66a78864319437 Wang Wenhu 2020-04-08  104  {
c66a78864319437 Wang Wenhu 2020-04-08  105  	struct qsr_info *lookup;
c66a78864319437 Wang Wenhu 2020-04-08  106  	struct qsr_ops *ops =3D qsr->o=
ps;
c66a78864319437 Wang Wenhu 2020-04-08  107  	int ret;
c66a78864319437 Wang Wenhu 2020-04-08  108  =

c66a78864319437 Wang Wenhu 2020-04-08  109  	if (!ops->new_lookup)
c66a78864319437 Wang Wenhu 2020-04-08  110  		return 0;
c66a78864319437 Wang Wenhu 2020-04-08  111  =

c66a78864319437 Wang Wenhu 2020-04-08  112  	list_for_each_entry(lookup, &q=
sr->lookups, list) {
c66a78864319437 Wang Wenhu 2020-04-08  113  		if (lookup->service =3D=3D ne=
w->service &&
c66a78864319437 Wang Wenhu 2020-04-08  114  		    lookup->instance =3D=3D n=
ew->instance) {
c66a78864319437 Wang Wenhu 2020-04-08  115  			ret =3D ops->new_lookup(new,
c66a78864319437 Wang Wenhu 2020-04-08 @116  							lookup->client.node,
c66a78864319437 Wang Wenhu 2020-04-08 @117  							lookup->client.port);
c66a78864319437 Wang Wenhu 2020-04-08  118  			if (ret < 0)
c66a78864319437 Wang Wenhu 2020-04-08  119  				pr_err("Error to notice cli=
ent of new server, %d\n", ret);
c66a78864319437 Wang Wenhu 2020-04-08  120  			else
c66a78864319437 Wang Wenhu 2020-04-08  121  				list_del(&lookup->list);
c66a78864319437 Wang Wenhu 2020-04-08  122  			return 0;
c66a78864319437 Wang Wenhu 2020-04-08  123  		}
c66a78864319437 Wang Wenhu 2020-04-08  124  	}
c66a78864319437 Wang Wenhu 2020-04-08  125  =

c66a78864319437 Wang Wenhu 2020-04-08  126  	return 0;
c66a78864319437 Wang Wenhu 2020-04-08  127  }
c66a78864319437 Wang Wenhu 2020-04-08  128  =

c66a78864319437 Wang Wenhu 2020-04-08  129  static int qsr_new_lookup(struc=
t qsr_info *svc, u32 node, u32 port)
c66a78864319437 Wang Wenhu 2020-04-08  130  {
c66a78864319437 Wang Wenhu 2020-04-08  131  	struct qrtr_ctrl_pkt pkt;
c66a78864319437 Wang Wenhu 2020-04-08  132  	struct sockaddr_qrtr sq;
c66a78864319437 Wang Wenhu 2020-04-08  133  	struct msghdr msg =3D { };
c66a78864319437 Wang Wenhu 2020-04-08  134  	struct kvec iv =3D { &pkt, siz=
eof(pkt) };
c66a78864319437 Wang Wenhu 2020-04-08  135  	int ret =3D 0;
c66a78864319437 Wang Wenhu 2020-04-08  136  =

c66a78864319437 Wang Wenhu 2020-04-08  137  	memset(&pkt, 0, sizeof(pkt));
c66a78864319437 Wang Wenhu 2020-04-08  138  	pkt.cmd =3D cpu_to_le32(QRTR_T=
YPE_NEW_SERVER);
c66a78864319437 Wang Wenhu 2020-04-08  139  	pkt.server.service =3D cpu_to_=
le32(svc->service);
c66a78864319437 Wang Wenhu 2020-04-08 @140  	pkt.server.instance =3D cpu_to=
_le32(svc->instance);
c66a78864319437 Wang Wenhu 2020-04-08 @141  	pkt.server.node =3D cpu_to_le3=
2(svc->server.node);
c66a78864319437 Wang Wenhu 2020-04-08  142  	pkt.server.port =3D cpu_to_le3=
2(svc->server.port);
c66a78864319437 Wang Wenhu 2020-04-08  143  =

c66a78864319437 Wang Wenhu 2020-04-08  144  	sq.sq_family =3D AF_QIPCRTR;
c66a78864319437 Wang Wenhu 2020-04-08  145  	sq.sq_node =3D node;
c66a78864319437 Wang Wenhu 2020-04-08  146  	sq.sq_port =3D port;
c66a78864319437 Wang Wenhu 2020-04-08  147  =

c66a78864319437 Wang Wenhu 2020-04-08  148  	msg.msg_name =3D &sq;
c66a78864319437 Wang Wenhu 2020-04-08  149  	msg.msg_namelen =3D sizeof(sq);
c66a78864319437 Wang Wenhu 2020-04-08  150  =

c66a78864319437 Wang Wenhu 2020-04-08  151  	mutex_lock(&qsr->qsr_lock);
c66a78864319437 Wang Wenhu 2020-04-08  152  	if (qsr->sk) {
c66a78864319437 Wang Wenhu 2020-04-08  153  		ret =3D kernel_sendmsg(qsr->s=
k, &msg, &iv, 1, sizeof(pkt));
c66a78864319437 Wang Wenhu 2020-04-08  154  		if (ret < 0)
c66a78864319437 Wang Wenhu 2020-04-08  155  			pr_err("Error to send server=
 info to client, %d\n", ret);
c66a78864319437 Wang Wenhu 2020-04-08  156  	}
c66a78864319437 Wang Wenhu 2020-04-08  157  	mutex_unlock(&qsr->qsr_lock);
c66a78864319437 Wang Wenhu 2020-04-08  158  =

c66a78864319437 Wang Wenhu 2020-04-08  159  	return ret;
c66a78864319437 Wang Wenhu 2020-04-08  160  }
c66a78864319437 Wang Wenhu 2020-04-08  161  =

c66a78864319437 Wang Wenhu 2020-04-08  162  static void qsr_recv_new_server=
(u32 service,
c66a78864319437 Wang Wenhu 2020-04-08  163  				u32 instance,
c66a78864319437 Wang Wenhu 2020-04-08  164  				u32 node,
c66a78864319437 Wang Wenhu 2020-04-08  165  				u32 port)
c66a78864319437 Wang Wenhu 2020-04-08  166  {
c66a78864319437 Wang Wenhu 2020-04-08  167  	struct qsr_ops *ops =3D qsr->o=
ps;
c66a78864319437 Wang Wenhu 2020-04-08  168  	struct qsr_info *svc, *temp;
c66a78864319437 Wang Wenhu 2020-04-08  169  	int ret;
c66a78864319437 Wang Wenhu 2020-04-08  170  =

c66a78864319437 Wang Wenhu 2020-04-08  171  	if (!ops->new_server)
c66a78864319437 Wang Wenhu 2020-04-08  172  		return;
c66a78864319437 Wang Wenhu 2020-04-08  173  =

c66a78864319437 Wang Wenhu 2020-04-08  174  	if (!node && !port)
c66a78864319437 Wang Wenhu 2020-04-08  175  		return;
c66a78864319437 Wang Wenhu 2020-04-08  176  =

c66a78864319437 Wang Wenhu 2020-04-08  177  	list_for_each_entry(temp, &qsr=
->services, list) {
c66a78864319437 Wang Wenhu 2020-04-08 @178  		if (temp->service =3D=3D serv=
ice && temp->instance =3D=3D instance) {
c66a78864319437 Wang Wenhu 2020-04-08  179  			pr_err("Error server exists,=
 service:0x%x instance:0x%x",
c66a78864319437 Wang Wenhu 2020-04-08  180  			       service, instance);
c66a78864319437 Wang Wenhu 2020-04-08  181  			return;
c66a78864319437 Wang Wenhu 2020-04-08  182  		}
c66a78864319437 Wang Wenhu 2020-04-08  183  	}
c66a78864319437 Wang Wenhu 2020-04-08  184  =

c66a78864319437 Wang Wenhu 2020-04-08  185  	svc =3D kzalloc(sizeof(*svc), =
GFP_KERNEL);
c66a78864319437 Wang Wenhu 2020-04-08  186  	if (!svc)
c66a78864319437 Wang Wenhu 2020-04-08  187  		return;
c66a78864319437 Wang Wenhu 2020-04-08  188  =

c66a78864319437 Wang Wenhu 2020-04-08 @189  	svc->service =3D service;
c66a78864319437 Wang Wenhu 2020-04-08 @190  	svc->instance =3D instance;
c66a78864319437 Wang Wenhu 2020-04-08 @191  	svc->server.node =3D node;
c66a78864319437 Wang Wenhu 2020-04-08 @192  	svc->server.port =3D port;
c66a78864319437 Wang Wenhu 2020-04-08  193  =

c66a78864319437 Wang Wenhu 2020-04-08  194  	ret =3D ops->new_server(svc);
c66a78864319437 Wang Wenhu 2020-04-08  195  	if (ret < 0)
c66a78864319437 Wang Wenhu 2020-04-08  196  		kfree(svc);
c66a78864319437 Wang Wenhu 2020-04-08  197  	else
c66a78864319437 Wang Wenhu 2020-04-08  198  		list_add(&svc->list, &qsr->se=
rvices);
c66a78864319437 Wang Wenhu 2020-04-08  199  }
c66a78864319437 Wang Wenhu 2020-04-08  200  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6496822740387514328==--

