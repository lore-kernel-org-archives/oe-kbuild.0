Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FE24A04
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071563; cv=none; b=QEYDH290EOW8rSEEJF3UoZwj3vsjY0hnvo+PDas+LKLKVG6a3s1hYug3uP+6VlVc8dHQy3YX8YRbo1zBbwEiQB3vZ/ww6vANFnw7XasQJO3zn0FjzF7firO6lludmBf0Ic1x4EZOB5avg1rfQJLWQpF6dihWPzPNEAQ86GbOEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071563; c=relaxed/simple;
	bh=Z5vCS4YzQjx0dVGuyP7RmSo+jxeZpKjW6l4L1vZ1giI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgIz2xF7AF/koV9nrBDOGe1gTsaf+/6yRxKqu96mCwC9L+4Zy4c9FKjVY+QsBohf8R4KpOMV69g3jrvSm4jB4NCdMGxPuYhozDepib4GUdUICIOnfb+0/nXg2DRu5nRfHaYMUNEy0Ab5vlgpQw4dVusiUHF+OnZOl+JL2UoCAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htSAXVkd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htSAXVkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707071560; x=1738607560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5vCS4YzQjx0dVGuyP7RmSo+jxeZpKjW6l4L1vZ1giI=;
  b=htSAXVkdKkuRBIQ6vydbYmIPzjaEE5BL4IjTTXUWHwMJq7Agc4nQb5qj
   gDTTmtVpbNeUdbNLSz9sfhNKlOgJ0bMmS8ybD/TOq30XKconDE6hXLK8n
   fSXbWixxvZLIYbB7QxSyP+VZjZf3nQ6NfUkMyK4SSqC1eUuexUq68/C7T
   gdK1YeBPoexUn6Ps4jLYL+cMhYNPnn4A4oORyOQVcknOz1oAK23e9lmDi
   PQuagyFoPD2tbfnqY3qpapodpFpJLkqMGiGZR9mkWZVgHQLj0tXSoopqC
   LZlylXxbzjW1WgozFdtEqC+as8P1+4zXgSHTFv2olAMUNsGhcFKmsQxXl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="657916"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="657916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 10:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="37957400"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2024 10:32:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWhIA-0006cm-0m;
	Sun, 04 Feb 2024 18:32:34 +0000
Date: Mon, 5 Feb 2024 02:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 3542/26476]
 net/wireguard/compat/compat.h: linux/netdevice.h is included more than once.
Message-ID: <202402050201.FPxT7yTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: dabd02495f84488ea48192d40aa013f3749c1bc1 [3542/26476] added wireguard, tag:0.0.20191219
:::::: branch date: 9 days ago
:::::: commit date: 3 years, 11 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402050201.FPxT7yTm-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/wireguard/compat/compat.h: linux/netdevice.h is included more than once.
>> net/wireguard/compat/compat.h: linux/slab.h is included more than once.
>> net/wireguard/compat/compat.h: linux/atomic.h is included more than once.
>> net/wireguard/compat/compat.h: linux/rcupdate.h is included more than once.
>> net/wireguard/compat/compat.h: linux/siphash.h is included more than once.
>> net/wireguard/compat/compat.h: net/netlink.h is included more than once.
>> net/wireguard/compat/compat.h: linux/mm.h is included more than once.
>> net/wireguard/compat/compat.h: linux/random.h is included more than once.
>> net/wireguard/compat/compat.h: net/ipv6.h is included more than once.
>> net/wireguard/compat/compat.h: linux/vmalloc.h is included more than once.
>> net/wireguard/compat/compat.h: net/genetlink.h is included more than once.
>> net/wireguard/compat/compat.h: linux/cache.h is included more than once.
>> net/wireguard/compat/compat.h: linux/skbuff.h is included more than once.
--
>> net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: linux/skbuff.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: linux/in6.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: net/udp_tunnel.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: linux/if.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel_partial_compat.h: linux/in.h is included more than once.
--
>> net/wireguard/tests/qemu/init.c: sys/types.h is included more than once.
--
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/udp.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/module.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: net/net_namespace.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/types.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: net/udp_tunnel.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: net/udp.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/errno.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/kernel.h is included more than once.
>> net/wireguard/compat/udp_tunnel/udp_tunnel.c: linux/socket.h is included more than once.

vim +161 net/wireguard/compat/compat.h

   159	
   160	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0) && !defined(ISRHEL7)
 > 161	#include <linux/netdevice.h>
   162	#ifndef netdev_alloc_pcpu_stats
   163	#define pcpu_sw_netstats pcpu_tstats
   164	#endif
   165	#ifndef netdev_alloc_pcpu_stats
   166	#define netdev_alloc_pcpu_stats alloc_percpu
   167	#endif
   168	#elif LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0) && !defined(ISRHEL7)
 > 169	#include <linux/netdevice.h>
   170	#ifndef netdev_alloc_pcpu_stats
   171	#define netdev_alloc_pcpu_stats(type)					\
   172	({									\
   173		typeof(type) __percpu *pcpu_stats = alloc_percpu(type);		\
   174		if (pcpu_stats)	{						\
   175			int __cpu;						\
   176			for_each_possible_cpu(__cpu) {				\
   177				typeof(type) *stat;				\
   178				stat = per_cpu_ptr(pcpu_stats, __cpu);		\
   179				u64_stats_init(&stat->syncp);			\
   180			}							\
   181		}								\
   182		pcpu_stats;							\
   183	})
   184	#endif
   185	#endif
   186	
   187	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0) && !defined(ISRHEL7)
   188	#include "checksum/checksum_partial_compat.h"
   189	static inline void *__compat_pskb_put(struct sk_buff *skb, struct sk_buff *tail, int len)
   190	{
   191		if (tail != skb) {
   192			skb->data_len += len;
   193			skb->len += len;
   194		}
   195		return skb_put(tail, len);
   196	}
   197	#define pskb_put __compat_pskb_put
   198	#endif
   199	
   200	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0) && !defined(ISRHEL7)
   201	#include <net/xfrm.h>
   202	static inline void skb_scrub_packet(struct sk_buff *skb, bool xnet)
   203	{
   204	#ifdef CONFIG_CAVIUM_OCTEON_IPFWD_OFFLOAD
   205		memset(&skb->cvm_info, 0, sizeof(skb->cvm_info));
   206		skb->cvm_reserved = 0;
   207	#endif
   208		skb->tstamp.tv64 = 0;
   209		skb->pkt_type = PACKET_HOST;
   210		skb->skb_iif = 0;
   211		skb_dst_drop(skb);
   212		secpath_reset(skb);
   213		nf_reset(skb);
   214		nf_reset_trace(skb);
   215		if (!xnet)
   216			return;
   217		skb_orphan(skb);
   218		skb->mark = 0;
   219	}
   220	#endif
   221	
   222	#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 0) || defined(ISUBUNTU1404)) && !defined(ISRHEL7)
   223	#include <linux/random.h>
   224	static inline u32 __compat_prandom_u32_max(u32 ep_ro)
   225	{
   226		return (u32)(((u64)prandom_u32() * ep_ro) >> 32);
   227	}
   228	#define prandom_u32_max __compat_prandom_u32_max
   229	#endif
   230	
   231	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 75) && !defined(ISRHEL7)
   232	#ifndef U8_MAX
   233	#define U8_MAX ((u8)~0U)
   234	#endif
   235	#ifndef S8_MAX
   236	#define S8_MAX ((s8)(U8_MAX >> 1))
   237	#endif
   238	#ifndef S8_MIN
   239	#define S8_MIN ((s8)(-S8_MAX - 1))
   240	#endif
   241	#ifndef U16_MAX
   242	#define U16_MAX ((u16)~0U)
   243	#endif
   244	#ifndef S16_MAX
   245	#define S16_MAX ((s16)(U16_MAX >> 1))
   246	#endif
   247	#ifndef S16_MIN
   248	#define S16_MIN ((s16)(-S16_MAX - 1))
   249	#endif
   250	#ifndef U32_MAX
   251	#define U32_MAX ((u32)~0U)
   252	#endif
   253	#ifndef S32_MAX
   254	#define S32_MAX ((s32)(U32_MAX >> 1))
   255	#endif
   256	#ifndef S32_MIN
   257	#define S32_MIN ((s32)(-S32_MAX - 1))
   258	#endif
   259	#ifndef U64_MAX
   260	#define U64_MAX ((u64)~0ULL)
   261	#endif
   262	#ifndef S64_MAX
   263	#define S64_MAX ((s64)(U64_MAX >> 1))
   264	#endif
   265	#ifndef S64_MIN
   266	#define S64_MIN ((s64)(-S64_MAX - 1))
   267	#endif
   268	#endif
   269	
   270	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 60) && !defined(ISRHEL7)
   271	/* Making this static may very well invalidate its usefulness,
   272	 * but so it goes with compat code. */
   273	static inline void memzero_explicit(void *s, size_t count)
   274	{
   275		memset(s, 0, count);
   276		barrier();
   277	}
   278	#endif
   279	
   280	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 0) && !defined(ISRHEL7)
   281	static const struct in6_addr __compat_in6addr_any = IN6ADDR_ANY_INIT;
   282	#define in6addr_any __compat_in6addr_any
   283	#endif
   284	
   285	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) && !defined(ISOPENSUSE15)
   286	#include <linux/completion.h>
   287	#include <linux/random.h>
   288	#include <linux/errno.h>
   289	struct rng_initializer {
   290		struct completion done;
   291		struct random_ready_callback cb;
   292	};
   293	static inline void rng_initialized_callback(struct random_ready_callback *cb)
   294	{
   295		complete(&container_of(cb, struct rng_initializer, cb)->done);
   296	}
   297	static inline int wait_for_random_bytes(void)
   298	{
   299		static bool rng_is_initialized = false;
   300		int ret;
   301		if (unlikely(!rng_is_initialized)) {
   302			struct rng_initializer rng = {
   303				.done = COMPLETION_INITIALIZER(rng.done),
   304				.cb = { .owner = THIS_MODULE, .func = rng_initialized_callback }
   305			};
   306			ret = add_random_ready_callback(&rng.cb);
   307			if (!ret) {
   308				ret = wait_for_completion_interruptible(&rng.done);
   309				if (ret) {
   310					del_random_ready_callback(&rng.cb);
   311					return ret;
   312				}
   313			} else if (ret != -EALREADY)
   314				return ret;
   315			rng_is_initialized = true;
   316		}
   317		return 0;
   318	}
   319	#elif LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)
   320	/* This is a disaster. Without this API, we really have no way of
   321	 * knowing if it's initialized. We just return that it has and hope
   322	 * for the best... */
   323	static inline int wait_for_random_bytes(void)
   324	{
   325		return 0;
   326	}
   327	#endif
   328	
   329	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) && !defined(ISRHEL8)
   330	#include <linux/random.h>
   331	#include <linux/slab.h>
   332	struct rng_is_initialized_callback {
   333		struct random_ready_callback cb;
   334		atomic_t *rng_state;
   335	};
   336	static inline void rng_is_initialized_callback(struct random_ready_callback *cb)
   337	{
   338		struct rng_is_initialized_callback *rdy = container_of(cb, struct rng_is_initialized_callback, cb);
   339		atomic_set(rdy->rng_state, 2);
   340		kfree(rdy);
   341	}
   342	static inline bool rng_is_initialized(void)
   343	{
   344		static atomic_t rng_state = ATOMIC_INIT(0);
   345	
   346		if (atomic_read(&rng_state) == 2)
   347			return true;
   348	
   349		if (atomic_cmpxchg(&rng_state, 0, 1) == 0) {
   350			int ret;
   351			struct rng_is_initialized_callback *rdy = kmalloc(sizeof(*rdy), GFP_ATOMIC);
   352			if (!rdy) {
   353				atomic_set(&rng_state, 0);
   354				return false;
   355			}
   356			rdy->cb.owner = THIS_MODULE;
   357			rdy->cb.func = rng_is_initialized_callback;
   358			rdy->rng_state = &rng_state;
   359			ret = add_random_ready_callback(&rdy->cb);
   360			if (ret)
   361				kfree(rdy);
   362			if (ret == -EALREADY) {
   363				atomic_set(&rng_state, 2);
   364				return true;
   365			} else if (ret)
   366				atomic_set(&rng_state, 0);
   367			return false;
   368		}
   369		return false;
   370	}
   371	#elif LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)
   372	/* This is a disaster. Without this API, we really have no way of
   373	 * knowing if it's initialized. We just return that it has and hope
   374	 * for the best... */
   375	static inline bool rng_is_initialized(void)
   376	{
   377		return true;
   378	}
   379	#endif
   380	
   381	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0) && !defined(ISOPENSUSE15)
   382	static inline int get_random_bytes_wait(void *buf, int nbytes)
   383	{
   384		int ret = wait_for_random_bytes();
   385		if (unlikely(ret))
   386			return ret;
   387		get_random_bytes(buf, nbytes);
   388		return 0;
   389	}
   390	#endif
   391	
   392	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0) && !defined(ISRHEL7)
   393	#define system_power_efficient_wq system_unbound_wq
   394	#endif
   395	
   396	#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 0)
   397	#include <linux/ktime.h>
   398	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)
   399	#include <linux/hrtimer.h>
   400	#ifndef ktime_get_real_ts64
   401	#define timespec64 timespec
   402	#define ktime_get_real_ts64 ktime_get_real_ts
   403	#endif
   404	#else
   405	#include <linux/timekeeping.h>
   406	#endif
   407	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 11, 0)
   408	static inline u64 __compat_jiffies64_to_nsecs(u64 j)
   409	{
   410	#if !(NSEC_PER_SEC % HZ)
   411		return (NSEC_PER_SEC / HZ) * j;
   412	#else
   413		return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
   414	#endif
   415	}
   416	#define jiffies64_to_nsecs __compat_jiffies64_to_nsecs
   417	#endif
   418	static inline u64 ktime_get_coarse_boottime_ns(void)
   419	{
   420	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)
   421		return ktime_to_ns(ktime_get_boottime());
   422	#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 12) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 53)
   423		return ktime_to_ns(ktime_mono_to_any(ns_to_ktime(jiffies64_to_nsecs(get_jiffies_64())), TK_OFFS_BOOT));
   424	#else
   425		return ktime_to_ns(ktime_get_coarse_boottime());
   426	#endif
   427	}
   428	#endif
   429	
   430	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0)
   431	#include <linux/inetdevice.h>
   432	static inline __be32 __compat_confirm_addr_indev(struct in_device *in_dev, __be32 dst,  __be32 local, int scope)
   433	{
   434		int same = 0;
   435		__be32 addr = 0;
   436		for_ifa(in_dev) {
   437			if (!addr && (local == ifa->ifa_local || !local) && ifa->ifa_scope <= scope) {
   438				addr = ifa->ifa_local;
   439				if (same)
   440					break;
   441			}
   442			if (!same) {
   443				same = (!local || inet_ifa_match(local, ifa)) && (!dst || inet_ifa_match(dst, ifa));
   444				if (same && addr) {
   445					if (local || !dst)
   446						break;
   447					if (inet_ifa_match(addr, ifa))
   448						break;
   449					if (ifa->ifa_scope <= scope) {
   450						addr = ifa->ifa_local;
   451						break;
   452					}
   453					same = 0;
   454				}
   455			}
   456		} endfor_ifa(in_dev);
   457		return same ? addr : 0;
   458	}
   459	static inline __be32 __compat_inet_confirm_addr(struct net *net, struct in_device *in_dev, __be32 dst, __be32 local, int scope)
   460	{
   461		__be32 addr = 0;
   462		struct net_device *dev;
   463		if (in_dev)
   464			return __compat_confirm_addr_indev(in_dev, dst, local, scope);
   465		rcu_read_lock();
   466		for_each_netdev_rcu(net, dev) {
   467			in_dev = __in_dev_get_rcu(dev);
   468			if (in_dev) {
   469				addr = __compat_confirm_addr_indev(in_dev, dst, local, scope);
   470				if (addr)
   471					break;
   472			}
   473		}
   474		rcu_read_unlock();
   475		return addr;
   476	}
   477	#define inet_confirm_addr __compat_inet_confirm_addr
   478	#endif
   479	
   480	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 12, 0)
   481	#include <linux/vmalloc.h>
   482	#include <linux/mm.h>
   483	#include <linux/slab.h>
   484	static inline void *__compat_kvmalloc(size_t size, gfp_t flags)
   485	{
   486		gfp_t kmalloc_flags = flags;
   487		void *ret;
   488		if (size > PAGE_SIZE) {
   489			kmalloc_flags |= __GFP_NOWARN;
   490			if (!(kmalloc_flags & __GFP_REPEAT) || (size <= PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
   491				kmalloc_flags |= __GFP_NORETRY;
   492		}
   493		ret = kmalloc(size, kmalloc_flags);
   494		if (ret || size <= PAGE_SIZE)
   495			return ret;
   496		return __vmalloc(size, flags, PAGE_KERNEL);
   497	}
   498	static inline void *__compat_kvzalloc(size_t size, gfp_t flags)
   499	{
   500		return __compat_kvmalloc(size, flags | __GFP_ZERO);
   501	}
   502	#define kvmalloc __compat_kvmalloc
   503	#define kvzalloc __compat_kvzalloc
   504	#endif
   505	
   506	#if ((LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 41)) && !defined(ISUBUNTU1404)
   507	#include <linux/vmalloc.h>
   508	#include <linux/mm.h>
   509	static inline void __compat_kvfree(const void *addr)
   510	{
   511		if (is_vmalloc_addr(addr))
   512			vfree(addr);
   513		else
   514			kfree(addr);
   515	}
   516	#define kvfree __compat_kvfree
   517	#endif
   518	
   519	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 11, 9)
 > 520	#include <linux/netdevice.h>
   521	#define priv_destructor destructor
   522	#endif
   523	
   524	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0) && !defined(ISOPENSUSE15)
   525	#define wg_newlink(a,b,c,d,e) wg_newlink(a,b,c,d)
   526	#endif
   527	
   528	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 12, 0)
   529	#include <net/netlink.h>
   530	#include <net/genetlink.h>
   531	#define nlmsg_parse(a, b, c, d, e, f) nlmsg_parse(a, b, c, d, e)
   532	#define nla_parse_nested(a, b, c, d, e) nla_parse_nested(a, b, c, d)
   533	#endif
   534	
   535	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 10, 0) && !defined(ISRHEL7)
   536	static inline struct nlattr **genl_family_attrbuf(const struct genl_family *family)
   537	{
   538		return family->attrbuf;
   539	}
   540	#endif
   541	
   542	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 0)
   543	#define PTR_ERR_OR_ZERO(p) PTR_RET(p)
   544	#endif
   545	
   546	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 7, 0)
   547	#include <net/netlink.h>
   548	#define nla_put_u64_64bit(a, b, c, d) nla_put_u64(a, b, c)
   549	#endif
   550	
   551	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0)
   552	#include <net/genetlink.h>
   553	#ifndef GENL_UNS_ADMIN_PERM
   554	#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
   555	#endif
   556	#endif
   557	
   558	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 10, 0) && !defined(ISRHEL7)
   559	#include <net/genetlink.h>
   560	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
   561	#define genl_register_family(a) genl_register_family_with_ops(a, genl_ops, ARRAY_SIZE(genl_ops))
   562	#define COMPAT_CANNOT_USE_CONST_GENL_OPS
   563	#else
   564	#define genl_register_family(a) genl_register_family_with_ops(a, genl_ops)
   565	#endif
   566	#define COMPAT_CANNOT_USE_GENL_NOPS
   567	#endif
   568	
   569	#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 2) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 16) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 65) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 101) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 84)
   570	#define __COMPAT_NETLINK_DUMP_BLOCK { \
   571		int ret; \
   572		skb->end -= nlmsg_total_size(sizeof(int)); \
   573		ret = wg_get_device_dump_real(skb, cb); \
   574		skb->end += nlmsg_total_size(sizeof(int)); \
   575		return ret; \
   576	}
   577	#define __COMPAT_NETLINK_DUMP_OVERRIDE
   578	#else
   579	#define __COMPAT_NETLINK_DUMP_BLOCK return wg_get_device_dump_real(skb, cb);
   580	#endif
   581	#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 8) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 25) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 87)
   582	#define wg_get_device_dump(a, b) wg_get_device_dump_real(a, b); \
   583	static int wg_get_device_dump(a, b) { \
   584		struct wg_device *wg = (struct wg_device *)cb->args[0]; \
   585		if (!wg) { \
   586			int ret = wg_get_device_start(cb); \
   587			if (ret) \
   588				return ret; \
   589		} \
   590		__COMPAT_NETLINK_DUMP_BLOCK \
   591	} \
   592	static int wg_get_device_dump_real(a, b)
   593	#define COMPAT_CANNOT_USE_NETLINK_START
   594	#elif defined(__COMPAT_NETLINK_DUMP_OVERRIDE)
   595	#define wg_get_device_dump(a, b) wg_get_device_dump_real(a, b); \
   596	static int wg_get_device_dump(a, b) { \
   597		__COMPAT_NETLINK_DUMP_BLOCK \
   598	} \
   599	static int wg_get_device_dump_real(a, b)
   600	#endif
   601	
   602	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)
   603	#define COMPAT_CANNOT_USE_IN6_DEV_GET
   604	#endif
   605	
   606	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0)
   607	#define COMPAT_CANNOT_USE_IFF_NO_QUEUE
   608	#endif
   609	
   610	#if defined(CONFIG_X86_64) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0)
   611	#include <asm/user.h>
   612	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)
   613	#include <asm/xsave.h>
   614	#include <asm/xcr.h>
   615	static inline int cpu_has_xfeatures(u64 xfeatures_needed, const char **feature_name)
   616	{
   617		return boot_cpu_has(X86_FEATURE_XSAVE) && xgetbv(XCR_XFEATURE_ENABLED_MASK) & xfeatures_needed;
   618	}
   619	#endif
   620	#ifndef XFEATURE_MASK_YMM
   621	#define XFEATURE_MASK_YMM XSTATE_YMM
   622	#endif
   623	#ifndef XFEATURE_MASK_SSE
   624	#define XFEATURE_MASK_SSE XSTATE_SSE
   625	#endif
   626	#ifndef XSTATE_AVX512
   627	#define XSTATE_AVX512 (XSTATE_OPMASK | XSTATE_ZMM_Hi256 | XSTATE_Hi16_ZMM)
   628	#endif
   629	#ifndef XFEATURE_MASK_AVX512
   630	#define XFEATURE_MASK_AVX512 XSTATE_AVX512
   631	#endif
   632	#endif
   633	
   634	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0) && defined(CONFIG_X86_64)
   635	/* This is incredibly dumb and reckless, but as it turns out, there's
   636	 * not really hardware Linux runs properly on that supports F but not BW
   637	 * and VL, so in practice this isn't so bad. Plus, this is compat layer,
   638	 * so the bar remains fairly low.
   639	 */
   640	#include <asm/cpufeature.h>
   641	#ifndef X86_FEATURE_AVX512BW
   642	#define X86_FEATURE_AVX512BW X86_FEATURE_AVX512F
   643	#endif
   644	#ifndef X86_FEATURE_AVX512VL
   645	#define X86_FEATURE_AVX512VL X86_FEATURE_AVX512F
   646	#endif
   647	#endif
   648	
   649	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0)
   650	struct __compat_dummy_container { char dev; };
   651	#define netdev_notifier_info net_device *)data); __attribute((unused)) char __compat_dummy_variable = ((struct __compat_dummy_container
   652	#endif
   653	
   654	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 0)
   655	#define timer_setup(a, b, c) setup_timer(a, ((void (*)(unsigned long))b), ((unsigned long)a))
   656	#define from_timer(var, callback_timer, timer_fieldname) container_of(callback_timer, typeof(*var), timer_fieldname)
   657	#endif
   658	
   659	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 3)
   660	#define COMPAT_CANNOT_USE_AVX512
   661	#endif
   662	
   663	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 0)
   664	#include <net/genetlink.h>
   665	#define genl_dump_check_consistent(a, b) genl_dump_check_consistent(a, b, &genl_family)
   666	#endif
   667	
   668	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0) && !defined(ISRHEL7) && !defined(ISOPENSUSE15)
   669	static inline void *skb_put_data(struct sk_buff *skb, const void *data, unsigned int len)
   670	{
   671		void *tmp = skb_put(skb, len);
   672		memcpy(tmp, data, len);
   673		return tmp;
   674	}
   675	#endif
   676	
   677	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) && !defined(ISRHEL7)
   678	#define napi_complete_done(n, work_done) napi_complete(n)
   679	#endif
   680	
   681	#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0)
 > 682	#include <linux/netdevice.h>
   683	/* NAPI_STATE_SCHED gets set by netif_napi_add anyway, so this is safe.
   684	 * Also, kernels without NAPI_STATE_NO_BUSY_POLL don't have a call to
   685	 * napi_hash_add inside of netif_napi_add.
   686	 */
   687	#define NAPI_STATE_NO_BUSY_POLL NAPI_STATE_SCHED
   688	#endif
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
