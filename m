Content-Type: multipart/mixed; boundary="===============8169114622866493840=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH nf-next] netfilter: ctnetlink: don't dump ct extensions of unconfirmed conntracks
Date: Tue, 15 Oct 2019 12:23:23 +0300
Message-ID: <20191015092322.GD21344@kadam>
In-Reply-To: <20191014194141.17626-1-fw@strlen.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8169114622866493840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Florian,

I love your patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Florian-Westphal/netfilter=
-ctnetlink-don-t-dump-ct-extensions-of-unconfirmed-conntracks/20191015-0400=
05
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git m=
aster

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/netfilter/nf_conntrack_netlink.c:537 ctnetlink_dump_info() warn: if sta=
tement not indented

# https://github.com/0day-ci/linux/commit/c8040548c0416425c95ae3b7008ef5d82=
9168d3b
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout c8040548c0416425c95ae3b7008ef5d829168d3b
vim +537 net/netfilter/nf_conntrack_netlink.c

c8040548c04164 Florian Westphal 2019-10-14  527  static int ctnetlink_dump_=
info(struct sk_buff *skb, struct nf_conn *ct)
c8040548c04164 Florian Westphal 2019-10-14  528  {
c8040548c04164 Florian Westphal 2019-10-14  529  	if (ctnetlink_dump_status=
(skb, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  530  	    ctnetlink_dump_mark(s=
kb, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  531  	    ctnetlink_dump_secctx=
(skb, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  532  	    ctnetlink_dump_id(skb=
, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  533  	    ctnetlink_dump_use(sk=
b, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  534  	    ctnetlink_dump_master=
(skb, ct) < 0)
c8040548c04164 Florian Westphal 2019-10-14  535  		return -1;
c8040548c04164 Florian Westphal 2019-10-14  536  =

c8040548c04164 Florian Westphal 2019-10-14 @537  	if (!test_bit(IPS_OFFLOAD=
_BIT, &ct->status) &&
c8040548c04164 Florian Westphal 2019-10-14  538  	    (ctnetlink_dump_timeo=
ut(skb, ct) < 0 ||
c8040548c04164 Florian Westphal 2019-10-14  539  	     ctnetlink_dump_proto=
info(skb, ct) < 0))

Part of the "return -EINVAL;" commit must be missing.  This should
generate a compile warning about reaching the end of a non-void
function.

c8040548c04164 Florian Westphal 2019-10-14  540  =

c8040548c04164 Florian Westphal 2019-10-14  541  	return 0;
c8040548c04164 Florian Westphal 2019-10-14  542  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============8169114622866493840==--

