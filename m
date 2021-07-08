Content-Type: multipart/mixed; boundary="===============7690741971529131979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:testing 6/8] fs/ceph/caps.c:2272 unsafe_request_wait() warn: potentially one past the end of array 'sessions[s->s_mds]'
Date: Thu, 08 Jul 2021 12:56:41 +0800
Message-ID: <202107081225.Sgpea8vn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7690741971529131979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: ceph-devel(a)vger.kernel.org
TO: Xiubo Li <xiubli@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://github.com/ceph/ceph-client.git testing
head:   64887ecca52b9d754c09837b7242b80463bda63c
commit: dcdb5c3121f827d6bd92a11f3ad0f0cc27e3d133 [6/8] ceph: flush the mdlo=
g before waiting on unsafe reqs
:::::: branch date: 11 hours ago
:::::: commit date: 34 hours ago
config: s390-randconfig-m031-20210707 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ceph/caps.c:2272 unsafe_request_wait() warn: potentially one past the en=
d of array 'sessions[s->s_mds]'
fs/ceph/caps.c:2272 unsafe_request_wait() warn: potentially one past the en=
d of array 'sessions[s->s_mds]'

Old smatch warnings:
fs/ceph/caps.c:2286 unsafe_request_wait() warn: potentially one past the en=
d of array 'sessions[s->s_mds]'
fs/ceph/caps.c:2286 unsafe_request_wait() warn: potentially one past the en=
d of array 'sessions[s->s_mds]'

vim +2272 fs/ceph/caps.c

a8599bd821d084 Sage Weil   2009-10-06  2212  =

da819c8150c5b6 Yan, Zheng  2015-05-27  2213  /*
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2214   * wait for any unsafe request=
s to complete.
da819c8150c5b6 Yan, Zheng  2015-05-27  2215   */
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2216  static int unsafe_request_wait=
(struct inode *inode)
da819c8150c5b6 Yan, Zheng  2015-05-27  2217  {
dcdb5c3121f827 Xiubo Li    2021-07-05  2218  	struct ceph_mds_client *mdsc =
=3D ceph_sb_to_client(inode->i_sb)->mdsc;
da819c8150c5b6 Yan, Zheng  2015-05-27  2219  	struct ceph_inode_info *ci =
=3D ceph_inode(inode);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2220  	struct ceph_mds_request *req1=
 =3D NULL, *req2 =3D NULL;
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2221  	int ret, err =3D 0;
da819c8150c5b6 Yan, Zheng  2015-05-27  2222  =

da819c8150c5b6 Yan, Zheng  2015-05-27  2223  	spin_lock(&ci->i_unsafe_lock);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2224  	if (S_ISDIR(inode->i_mode) &&=
 !list_empty(&ci->i_unsafe_dirops)) {
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2225  		req1 =3D list_last_entry(&ci=
->i_unsafe_dirops,
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2226  					struct ceph_mds_request,
da819c8150c5b6 Yan, Zheng  2015-05-27  2227  					r_unsafe_dir_item);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2228  		ceph_mdsc_get_request(req1);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2229  	}
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2230  	if (!list_empty(&ci->i_unsafe=
_iops)) {
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2231  		req2 =3D list_last_entry(&ci=
->i_unsafe_iops,
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2232  					struct ceph_mds_request,
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2233  					r_unsafe_target_item);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2234  		ceph_mdsc_get_request(req2);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2235  	}
da819c8150c5b6 Yan, Zheng  2015-05-27  2236  	spin_unlock(&ci->i_unsafe_loc=
k);
da819c8150c5b6 Yan, Zheng  2015-05-27  2237  =

dcdb5c3121f827 Xiubo Li    2021-07-05  2238  	/*
dcdb5c3121f827 Xiubo Li    2021-07-05  2239  	 * Trigger to flush the journ=
al logs in all the relevant MDSes
dcdb5c3121f827 Xiubo Li    2021-07-05  2240  	 * manually, or in the worst =
case we must wait at most 5 seconds
dcdb5c3121f827 Xiubo Li    2021-07-05  2241  	 * to wait the journal logs t=
o be flushed by the MDSes periodically.
dcdb5c3121f827 Xiubo Li    2021-07-05  2242  	 */
dcdb5c3121f827 Xiubo Li    2021-07-05  2243  	if (req1 || req2) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2244  		struct ceph_mds_session **se=
ssions =3D NULL;
dcdb5c3121f827 Xiubo Li    2021-07-05  2245  		struct ceph_mds_session *s;
dcdb5c3121f827 Xiubo Li    2021-07-05  2246  		struct ceph_mds_request *req;
dcdb5c3121f827 Xiubo Li    2021-07-05  2247  		unsigned int max;
dcdb5c3121f827 Xiubo Li    2021-07-05  2248  		int i;
dcdb5c3121f827 Xiubo Li    2021-07-05  2249  =

dcdb5c3121f827 Xiubo Li    2021-07-05  2250  		/*
dcdb5c3121f827 Xiubo Li    2021-07-05  2251  		 * The mdsc->max_sessions is=
 unlikely to be changed
dcdb5c3121f827 Xiubo Li    2021-07-05  2252  		 * mostly, here we will retr=
y it by reallocating the
dcdb5c3121f827 Xiubo Li    2021-07-05  2253  		 * sessions arrary memory to=
 get rid of the mdsc->mutex
dcdb5c3121f827 Xiubo Li    2021-07-05  2254  		 * lock.
dcdb5c3121f827 Xiubo Li    2021-07-05  2255  		 */
dcdb5c3121f827 Xiubo Li    2021-07-05  2256  retry:
dcdb5c3121f827 Xiubo Li    2021-07-05  2257  		max =3D mdsc->max_sessions;
dcdb5c3121f827 Xiubo Li    2021-07-05  2258  		sessions =3D krealloc(sessio=
ns, max * sizeof(s), __GFP_ZERO);
dcdb5c3121f827 Xiubo Li    2021-07-05  2259  		if (!sessions) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2260  			err =3D -ENOMEM;
dcdb5c3121f827 Xiubo Li    2021-07-05  2261  			goto out;
dcdb5c3121f827 Xiubo Li    2021-07-05  2262  		}
dcdb5c3121f827 Xiubo Li    2021-07-05  2263  		spin_lock(&ci->i_unsafe_lock=
);
dcdb5c3121f827 Xiubo Li    2021-07-05  2264  		if (req1) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2265  			list_for_each_entry(req, &c=
i->i_unsafe_dirops,
dcdb5c3121f827 Xiubo Li    2021-07-05  2266  					    r_unsafe_dir_item) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2267  				s =3D req->r_session;
dcdb5c3121f827 Xiubo Li    2021-07-05  2268  				if (unlikely(s->s_mds > ma=
x)) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2269  					spin_unlock(&ci->i_unsafe=
_lock);
dcdb5c3121f827 Xiubo Li    2021-07-05  2270  					goto retry;
dcdb5c3121f827 Xiubo Li    2021-07-05  2271  				}
dcdb5c3121f827 Xiubo Li    2021-07-05 @2272  				if (!sessions[s->s_mds]) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2273  					s =3D ceph_get_mds_sessio=
n(s);
dcdb5c3121f827 Xiubo Li    2021-07-05  2274  					sessions[s->s_mds] =3D s;
dcdb5c3121f827 Xiubo Li    2021-07-05  2275  				}
dcdb5c3121f827 Xiubo Li    2021-07-05  2276  			}
dcdb5c3121f827 Xiubo Li    2021-07-05  2277  		}
dcdb5c3121f827 Xiubo Li    2021-07-05  2278  		if (req2) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2279  			list_for_each_entry(req, &c=
i->i_unsafe_iops,
dcdb5c3121f827 Xiubo Li    2021-07-05  2280  					    r_unsafe_target_item)=
 {
dcdb5c3121f827 Xiubo Li    2021-07-05  2281  				s =3D req->r_session;
dcdb5c3121f827 Xiubo Li    2021-07-05  2282  				if (unlikely(s->s_mds > ma=
x)) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2283  					spin_unlock(&ci->i_unsafe=
_lock);
dcdb5c3121f827 Xiubo Li    2021-07-05  2284  					goto retry;
dcdb5c3121f827 Xiubo Li    2021-07-05  2285  				}
dcdb5c3121f827 Xiubo Li    2021-07-05  2286  				if (!sessions[s->s_mds]) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2287  					s =3D ceph_get_mds_sessio=
n(s);
dcdb5c3121f827 Xiubo Li    2021-07-05  2288  					sessions[s->s_mds] =3D s;
dcdb5c3121f827 Xiubo Li    2021-07-05  2289  				}
dcdb5c3121f827 Xiubo Li    2021-07-05  2290  			}
dcdb5c3121f827 Xiubo Li    2021-07-05  2291  		}
dcdb5c3121f827 Xiubo Li    2021-07-05  2292  		spin_unlock(&ci->i_unsafe_lo=
ck);
dcdb5c3121f827 Xiubo Li    2021-07-05  2293  =

dcdb5c3121f827 Xiubo Li    2021-07-05  2294  		/* the auth MDS */
dcdb5c3121f827 Xiubo Li    2021-07-05  2295  		spin_lock(&ci->i_ceph_lock);
dcdb5c3121f827 Xiubo Li    2021-07-05  2296  		if (ci->i_auth_cap) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2297  		      s =3D ci->i_auth_cap->=
session;
dcdb5c3121f827 Xiubo Li    2021-07-05  2298  		      if (!sessions[s->s_mds=
])
dcdb5c3121f827 Xiubo Li    2021-07-05  2299  			      sessions[s->s_mds] =
=3D ceph_get_mds_session(s);
dcdb5c3121f827 Xiubo Li    2021-07-05  2300  		}
dcdb5c3121f827 Xiubo Li    2021-07-05  2301  		spin_unlock(&ci->i_ceph_lock=
);
dcdb5c3121f827 Xiubo Li    2021-07-05  2302  =

dcdb5c3121f827 Xiubo Li    2021-07-05  2303  		/* send flush mdlog request =
to MDSes */
dcdb5c3121f827 Xiubo Li    2021-07-05  2304  		for (i =3D 0; i < max; i++) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2305  			s =3D sessions[i];
dcdb5c3121f827 Xiubo Li    2021-07-05  2306  			if (s) {
dcdb5c3121f827 Xiubo Li    2021-07-05  2307  				send_flush_mdlog(s);
dcdb5c3121f827 Xiubo Li    2021-07-05  2308  				ceph_put_mds_session(s);
dcdb5c3121f827 Xiubo Li    2021-07-05  2309  			}
dcdb5c3121f827 Xiubo Li    2021-07-05  2310  		}
dcdb5c3121f827 Xiubo Li    2021-07-05  2311  		kfree(sessions);
dcdb5c3121f827 Xiubo Li    2021-07-05  2312  	}
dcdb5c3121f827 Xiubo Li    2021-07-05  2313  =

4945a084799e24 Jeff Layton 2016-11-16  2314  	dout("unsafe_request_wait %p =
wait on tid %llu %llu\n",
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2315  	     inode, req1 ? req1->r_ti=
d : 0ULL, req2 ? req2->r_tid : 0ULL);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2316  	if (req1) {
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2317  		ret =3D !wait_for_completion=
_timeout(&req1->r_safe_completion,
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2318  					ceph_timeout_jiffies(req1=
->r_timeout));
da819c8150c5b6 Yan, Zheng  2015-05-27  2319  		if (ret)
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2320  			err =3D -EIO;
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2321  		ceph_mdsc_put_request(req1);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2322  	}
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2323  	if (req2) {
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2324  		ret =3D !wait_for_completion=
_timeout(&req2->r_safe_completion,
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2325  					ceph_timeout_jiffies(req2=
->r_timeout));
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2326  		if (ret)
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2327  			err =3D -EIO;
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2328  		ceph_mdsc_put_request(req2);
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2329  	}
dcdb5c3121f827 Xiubo Li    2021-07-05  2330  out:
68cd5b4b7612c2 Yan, Zheng  2015-10-27  2331  	return err;
da819c8150c5b6 Yan, Zheng  2015-05-27  2332  }
da819c8150c5b6 Yan, Zheng  2015-05-27  2333  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7690741971529131979==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7690741971529131979==--

