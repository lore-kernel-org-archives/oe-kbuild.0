Content-Type: multipart/mixed; boundary="===============8871795684763218634=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:net-next 1/2] net/ipv4/tcp.c:2140 tcp_zerocopy_receive() error: uninitialized symbol 'offset'.
Date: Mon, 28 Feb 2022 14:40:15 +0800
Message-ID: <202202281417.JZQlI9ss-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8871795684763218634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>

tree:   https://github.com/congwang/linux.git net-next
head:   0700b0bb26ca936a676359afeefae4e67baee300
commit: 2c8c2dd9e27f1bfab8c5a98a6b93e90d13f85f90 [1/2] tcp: clean up tcp_re=
ad_sock() code
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
228/202202281417.JZQlI9ss-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/tcp.c:2140 tcp_zerocopy_receive() error: uninitialized symbol 'off=
set'.

Old smatch warnings:
net/ipv4/tcp.c:4193 do_tcp_getsockopt() warn: check for integer overflow 'l=
en'

vim +/offset +2140 net/ipv4/tcp.c

7eeba1706eba6d Arjun Roy             2021-01-20  2058  =

94ab9eb9b234dd Arjun Roy             2020-12-02  2059  #define TCP_ZEROCOPY=
_PAGE_BATCH_SIZE 32
05255b823a6173 Eric Dumazet          2018-04-27  2060  static int tcp_zeroc=
opy_receive(struct sock *sk,
7eeba1706eba6d Arjun Roy             2021-01-20  2061  				struct tcp_zeroc=
opy_receive *zc,
7eeba1706eba6d Arjun Roy             2021-01-20  2062  				struct scm_times=
tamping_internal *tss)
05255b823a6173 Eric Dumazet          2018-04-27  2063  {
94ab9eb9b234dd Arjun Roy             2020-12-02  2064  	u32 length =3D 0, o=
ffset, vma_len, avail_len, copylen =3D 0;
05255b823a6173 Eric Dumazet          2018-04-27  2065  	unsigned long addre=
ss =3D (unsigned long)zc->address;
94ab9eb9b234dd Arjun Roy             2020-12-02  2066  	struct page *pages[=
TCP_ZEROCOPY_PAGE_BATCH_SIZE];
18fb76ed53865c Arjun Roy             2020-12-02  2067  	s32 copybuf_len =3D=
 zc->copybuf_len;
18fb76ed53865c Arjun Roy             2020-12-02  2068  	struct tcp_sock *tp=
 =3D tcp_sk(sk);
05255b823a6173 Eric Dumazet          2018-04-27  2069  	const skb_frag_t *f=
rags =3D NULL;
94ab9eb9b234dd Arjun Roy             2020-12-02  2070  	unsigned int pages_=
to_map =3D 0;
05255b823a6173 Eric Dumazet          2018-04-27  2071  	struct vm_area_stru=
ct *vma;
05255b823a6173 Eric Dumazet          2018-04-27  2072  	struct sk_buff *skb=
 =3D NULL;
18fb76ed53865c Arjun Roy             2020-12-02  2073  	u32 seq =3D tp->cop=
ied_seq;
94ab9eb9b234dd Arjun Roy             2020-12-02  2074  	u32 total_bytes_to_=
map;
18fb76ed53865c Arjun Roy             2020-12-02  2075  	int inq =3D tcp_inq=
(sk);
93ab6cc6916277 Eric Dumazet          2018-04-16  2076  	int ret;
93ab6cc6916277 Eric Dumazet          2018-04-16  2077  =

18fb76ed53865c Arjun Roy             2020-12-02  2078  	zc->copybuf_len =3D=
 0;
7eeba1706eba6d Arjun Roy             2021-01-20  2079  	zc->msg_flags =3D 0;
18fb76ed53865c Arjun Roy             2020-12-02  2080  =

05255b823a6173 Eric Dumazet          2018-04-27  2081  	if (address & (PAGE=
_SIZE - 1) || address !=3D zc->address)
93ab6cc6916277 Eric Dumazet          2018-04-16  2082  		return -EINVAL;
93ab6cc6916277 Eric Dumazet          2018-04-16  2083  =

93ab6cc6916277 Eric Dumazet          2018-04-16  2084  	if (sk->sk_state =
=3D=3D TCP_LISTEN)
05255b823a6173 Eric Dumazet          2018-04-27  2085  		return -ENOTCONN;
93ab6cc6916277 Eric Dumazet          2018-04-16  2086  =

93ab6cc6916277 Eric Dumazet          2018-04-16  2087  	sock_rps_record_flo=
w(sk);
93ab6cc6916277 Eric Dumazet          2018-04-16  2088  =

f21a3c48039891 Arjun Roy             2020-12-02  2089  	if (inq && inq <=3D=
 copybuf_len)
7eeba1706eba6d Arjun Roy             2021-01-20  2090  		return receive_fal=
lback_to_copy(sk, zc, inq, tss);
f21a3c48039891 Arjun Roy             2020-12-02  2091  =

936ced415751f7 Arjun Roy             2020-12-02  2092  	if (inq < PAGE_SIZE=
) {
936ced415751f7 Arjun Roy             2020-12-02  2093  		zc->length =3D 0;
936ced415751f7 Arjun Roy             2020-12-02  2094  		zc->recv_skip_hint=
 =3D inq;
936ced415751f7 Arjun Roy             2020-12-02  2095  		if (!inq && sock_f=
lag(sk, SOCK_DONE))
936ced415751f7 Arjun Roy             2020-12-02  2096  			return -EIO;
936ced415751f7 Arjun Roy             2020-12-02  2097  		return 0;
936ced415751f7 Arjun Roy             2020-12-02  2098  	}
936ced415751f7 Arjun Roy             2020-12-02  2099  =

d8ed45c5dcd455 Michel Lespinasse     2020-06-08  2100  	mmap_read_lock(curr=
ent->mm);
05255b823a6173 Eric Dumazet          2018-04-27  2101  =

47bdd1db16e67e Liam Howlett          2021-06-28  2102  	vma =3D vma_lookup(=
current->mm, address);
47bdd1db16e67e Liam Howlett          2021-06-28  2103  	if (!vma || vma->vm=
_ops !=3D &tcp_vm_ops) {
d8ed45c5dcd455 Michel Lespinasse     2020-06-08  2104  		mmap_read_unlock(c=
urrent->mm);
e776af608f692a Eric Dumazet          2020-05-14  2105  		return -EINVAL;
e776af608f692a Eric Dumazet          2020-05-14  2106  	}
18fb76ed53865c Arjun Roy             2020-12-02  2107  	vma_len =3D min_t(u=
nsigned long, zc->length, vma->vm_end - address);
18fb76ed53865c Arjun Roy             2020-12-02  2108  	avail_len =3D min_t=
(u32, vma_len, inq);
94ab9eb9b234dd Arjun Roy             2020-12-02  2109  	total_bytes_to_map =
=3D avail_len & ~(PAGE_SIZE - 1);
94ab9eb9b234dd Arjun Roy             2020-12-02  2110  	if (total_bytes_to_=
map) {
94ab9eb9b234dd Arjun Roy             2020-12-02  2111  		if (!(zc->flags & =
TCP_RECEIVE_ZEROCOPY_FLAG_TLB_CLEAN_HINT))
94ab9eb9b234dd Arjun Roy             2020-12-02  2112  			zap_page_range(vm=
a, address, total_bytes_to_map);
94ab9eb9b234dd Arjun Roy             2020-12-02  2113  		zc->length =3D tot=
al_bytes_to_map;
05255b823a6173 Eric Dumazet          2018-04-27  2114  		zc->recv_skip_hint=
 =3D 0;
8f2b02931175ca Soheil Hassas Yeganeh 2018-09-26  2115  	} else {
18fb76ed53865c Arjun Roy             2020-12-02  2116  		zc->length =3D ava=
il_len;
18fb76ed53865c Arjun Roy             2020-12-02  2117  		zc->recv_skip_hint=
 =3D avail_len;
8f2b02931175ca Soheil Hassas Yeganeh 2018-09-26  2118  	}
05255b823a6173 Eric Dumazet          2018-04-27  2119  	ret =3D 0;
05255b823a6173 Eric Dumazet          2018-04-27  2120  	while (length + PAG=
E_SIZE <=3D zc->length) {
98917cf0d6eda0 Arjun Roy             2020-12-02  2121  		int mappable_offse=
t;
94ab9eb9b234dd Arjun Roy             2020-12-02  2122  		struct page *page;
98917cf0d6eda0 Arjun Roy             2020-12-02  2123  =

05255b823a6173 Eric Dumazet          2018-04-27  2124  		if (zc->recv_skip_=
hint < PAGE_SIZE) {
7fba5309efe24e Arjun Roy             2020-12-02  2125  			u32 offset_frag;
7fba5309efe24e Arjun Roy             2020-12-02  2126  =

05255b823a6173 Eric Dumazet          2018-04-27  2127  			if (skb) {
0e627190563e8b Arjun Roy             2019-12-15  2128  				if (zc->recv_ski=
p_hint > 0)
0e627190563e8b Arjun Roy             2019-12-15  2129  					break;
05255b823a6173 Eric Dumazet          2018-04-27  2130  				skb =3D skb->nex=
t;
05255b823a6173 Eric Dumazet          2018-04-27  2131  				offset =3D seq -=
 TCP_SKB_CB(skb)->seq;
05255b823a6173 Eric Dumazet          2018-04-27  2132  			} else {
93ab6cc6916277 Eric Dumazet          2018-04-16  2133  				skb =3D tcp_recv=
_skb(sk, seq, &offset);
05255b823a6173 Eric Dumazet          2018-04-27  2134  			}
7eeba1706eba6d Arjun Roy             2021-01-20  2135  =

7eeba1706eba6d Arjun Roy             2021-01-20  2136  			if (TCP_SKB_CB(sk=
b)->has_rxtstamp) {
7eeba1706eba6d Arjun Roy             2021-01-20  2137  				tcp_update_recv_=
tstamps(skb, tss);
7eeba1706eba6d Arjun Roy             2021-01-20  2138  				zc->msg_flags |=
=3D TCP_CMSG_TS;
7eeba1706eba6d Arjun Roy             2021-01-20  2139  			}
05255b823a6173 Eric Dumazet          2018-04-27 @2140  			zc->recv_skip_hin=
t =3D skb->len - offset;
7fba5309efe24e Arjun Roy             2020-12-02  2141  			frags =3D skb_adv=
ance_to_frag(skb, offset, &offset_frag);
7fba5309efe24e Arjun Roy             2020-12-02  2142  			if (!frags || off=
set_frag)
05255b823a6173 Eric Dumazet          2018-04-27  2143  				break;
93ab6cc6916277 Eric Dumazet          2018-04-16  2144  		}
789762ceec8f33 Soheil Hassas Yeganeh 2018-09-26  2145  =

98917cf0d6eda0 Arjun Roy             2020-12-02  2146  		mappable_offset =
=3D find_next_mappable_frag(frags,
98917cf0d6eda0 Arjun Roy             2020-12-02  2147  							  zc->recv_sk=
ip_hint);
98917cf0d6eda0 Arjun Roy             2020-12-02  2148  		if (mappable_offse=
t) {
98917cf0d6eda0 Arjun Roy             2020-12-02  2149  			zc->recv_skip_hin=
t =3D mappable_offset;
05255b823a6173 Eric Dumazet          2018-04-27  2150  			break;
789762ceec8f33 Soheil Hassas Yeganeh 2018-09-26  2151  		}
94ab9eb9b234dd Arjun Roy             2020-12-02  2152  		page =3D skb_frag_=
page(frags);
94ab9eb9b234dd Arjun Roy             2020-12-02  2153  		prefetchw(page);
94ab9eb9b234dd Arjun Roy             2020-12-02  2154  		pages[pages_to_map=
++] =3D page;
05255b823a6173 Eric Dumazet          2018-04-27  2155  		length +=3D PAGE_S=
IZE;
05255b823a6173 Eric Dumazet          2018-04-27  2156  		zc->recv_skip_hint=
 -=3D PAGE_SIZE;
05255b823a6173 Eric Dumazet          2018-04-27  2157  		frags++;
94ab9eb9b234dd Arjun Roy             2020-12-02  2158  		if (pages_to_map =
=3D=3D TCP_ZEROCOPY_PAGE_BATCH_SIZE ||
94ab9eb9b234dd Arjun Roy             2020-12-02  2159  		    zc->recv_skip_=
hint < PAGE_SIZE) {
94ab9eb9b234dd Arjun Roy             2020-12-02  2160  			/* Either full ba=
tch, or we're about to go to next skb
94ab9eb9b234dd Arjun Roy             2020-12-02  2161  			 * (and we cannot=
 unroll failed ops across skbs).
94ab9eb9b234dd Arjun Roy             2020-12-02  2162  			 */
94ab9eb9b234dd Arjun Roy             2020-12-02  2163  			ret =3D tcp_zeroc=
opy_vm_insert_batch(vma, pages,
94ab9eb9b234dd Arjun Roy             2020-12-02  2164  							   pages_to_m=
ap,
94ab9eb9b234dd Arjun Roy             2020-12-02  2165  							   &address, =
&length,
94ab9eb9b234dd Arjun Roy             2020-12-02  2166  							   &seq, zc,
94ab9eb9b234dd Arjun Roy             2020-12-02  2167  							   total_byte=
s_to_map);
3763a24c727ecf Arjun Roy             2020-06-07  2168  			if (ret)
3763a24c727ecf Arjun Roy             2020-06-07  2169  				goto out;
94ab9eb9b234dd Arjun Roy             2020-12-02  2170  			pages_to_map =3D =
0;
3763a24c727ecf Arjun Roy             2020-06-07  2171  		}
3763a24c727ecf Arjun Roy             2020-06-07  2172  	}
94ab9eb9b234dd Arjun Roy             2020-12-02  2173  	if (pages_to_map) {
94ab9eb9b234dd Arjun Roy             2020-12-02  2174  		ret =3D tcp_zeroco=
py_vm_insert_batch(vma, pages, pages_to_map,
94ab9eb9b234dd Arjun Roy             2020-12-02  2175  						   &address, &=
length, &seq,
94ab9eb9b234dd Arjun Roy             2020-12-02  2176  						   zc, total_b=
ytes_to_map);
93ab6cc6916277 Eric Dumazet          2018-04-16  2177  	}
05255b823a6173 Eric Dumazet          2018-04-27  2178  out:
d8ed45c5dcd455 Michel Lespinasse     2020-06-08  2179  	mmap_read_unlock(cu=
rrent->mm);
18fb76ed53865c Arjun Roy             2020-12-02  2180  	/* Try to copy stra=
ggler data. */
18fb76ed53865c Arjun Roy             2020-12-02  2181  	if (!ret)
7eeba1706eba6d Arjun Roy             2021-01-20  2182  		copylen =3D tcp_zc=
_handle_leftover(zc, sk, skb, &seq, copybuf_len, tss);
18fb76ed53865c Arjun Roy             2020-12-02  2183  =

18fb76ed53865c Arjun Roy             2020-12-02  2184  	if (length + copyle=
n) {
7db48e98393028 Eric Dumazet          2019-10-10  2185  		WRITE_ONCE(tp->cop=
ied_seq, seq);
93ab6cc6916277 Eric Dumazet          2018-04-16  2186  		tcp_rcv_space_adju=
st(sk);
93ab6cc6916277 Eric Dumazet          2018-04-16  2187  =

93ab6cc6916277 Eric Dumazet          2018-04-16  2188  		/* Clean up data w=
e have read: This will do ACK frames. */
93ab6cc6916277 Eric Dumazet          2018-04-16  2189  		tcp_recv_skb(sk, s=
eq, &offset);
18fb76ed53865c Arjun Roy             2020-12-02  2190  		tcp_cleanup_rbuf(s=
k, length + copylen);
93ab6cc6916277 Eric Dumazet          2018-04-16  2191  		ret =3D 0;
05255b823a6173 Eric Dumazet          2018-04-27  2192  		if (length =3D=3D =
zc->length)
05255b823a6173 Eric Dumazet          2018-04-27  2193  			zc->recv_skip_hin=
t =3D 0;
05255b823a6173 Eric Dumazet          2018-04-27  2194  	} else {
05255b823a6173 Eric Dumazet          2018-04-27  2195  		if (!zc->recv_skip=
_hint && sock_flag(sk, SOCK_DONE))
05255b823a6173 Eric Dumazet          2018-04-27  2196  			ret =3D -EIO;
05255b823a6173 Eric Dumazet          2018-04-27  2197  	}
05255b823a6173 Eric Dumazet          2018-04-27  2198  	zc->length =3D leng=
th;
93ab6cc6916277 Eric Dumazet          2018-04-16  2199  	return ret;
93ab6cc6916277 Eric Dumazet          2018-04-16  2200  }
05255b823a6173 Eric Dumazet          2018-04-27  2201  #endif
93ab6cc6916277 Eric Dumazet          2018-04-16  2202  =


:::::: The code at line 2140 was first introduced by commit
:::::: 05255b823a6173525587f29c4e8f1ca33fd7677d tcp: add TCP_ZEROCOPY_RECEI=
VE support for zerocopy receive

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8871795684763218634==--

