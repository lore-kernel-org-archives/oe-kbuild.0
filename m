Content-Type: multipart/mixed; boundary="===============2737712228974016145=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:sch_bpf 2/4] net/core/skb_map.c:261 ____bpf_skb_map_pop() warn: returning freed memory 'skb'
Date: Fri, 27 May 2022 16:25:25 +0800
Message-ID: <202205271602.qZ21Hhnl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2737712228974016145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <xiyou.wangcong@gmail.com>

tree:   https://github.com/congwang/linux.git sch_bpf
head:   d7144f4291a2882e698a6d9d83f7e614d97be9c8
commit: c27f47230e7935f94ef17b29accb49defa7be17e [2/4] bpf: introduce skb m=
ap
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: s390-randconfig-m031-20220524 (https://download.01.org/0day-ci/arch=
ive/20220527/202205271602.qZ21Hhnl-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/skb_map.c:261 ____bpf_skb_map_pop() warn: returning freed memory '=
skb'

Old smatch warnings:
net/core/skb_map.c:175 skb_map_get_next_key() error: we previously assumed =
'key' could be null (see line 170)

vim +/skb +261 net/core/skb_map.c

c27f47230e7935 Cong Wang 2020-11-08  244  =

c27f47230e7935 Cong Wang 2020-11-08  245  BPF_CALL_2(bpf_skb_map_pop, struc=
t bpf_map *, map, u64, key)
c27f47230e7935 Cong Wang 2020-11-08  246  {
c27f47230e7935 Cong Wang 2020-11-08  247  	struct bpf_skb_map *rb =3D bpf_s=
kb_map(map);
c27f47230e7935 Cong Wang 2020-11-08  248  	struct sk_buff *skb;
c27f47230e7935 Cong Wang 2020-11-08  249  	unsigned long flags;
c27f47230e7935 Cong Wang 2020-11-08  250  =

c27f47230e7935 Cong Wang 2020-11-08  251  	raw_spin_lock_irqsave(&rb->lock,=
 flags);
c27f47230e7935 Cong Wang 2020-11-08  252  	skb =3D skb_map_lookup_elem(map,=
 &key);
c27f47230e7935 Cong Wang 2020-11-08  253  	if (!skb) {
c27f47230e7935 Cong Wang 2020-11-08  254  		raw_spin_unlock_irqrestore(&rb-=
>lock, flags);
c27f47230e7935 Cong Wang 2020-11-08  255  		return (unsigned long)NULL;
c27f47230e7935 Cong Wang 2020-11-08  256  	}
c27f47230e7935 Cong Wang 2020-11-08  257  	rb_erase(&skb->rbnode, &rb->root=
);
c27f47230e7935 Cong Wang 2020-11-08  258  	raw_spin_unlock_irqrestore(&rb->=
lock, flags);
c27f47230e7935 Cong Wang 2020-11-08  259  	consume_skb(skb);
c27f47230e7935 Cong Wang 2020-11-08  260  	atomic_dec(&rb->count);
c27f47230e7935 Cong Wang 2020-11-08 @261  	return (unsigned long)skb;
c27f47230e7935 Cong Wang 2020-11-08  262  }
c27f47230e7935 Cong Wang 2020-11-08  263  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2737712228974016145==--

