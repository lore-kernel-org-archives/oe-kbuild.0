Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD0542A780
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139826; cv=none; b=KnN6RvhaxuokMCPC1FzIeAMNgpNlNdlXrGqCijBKZi+SlyCYpvwoENE2vkhDo/ajvwryVcQd5Y9UwR3f+RiKX5Xtv6q0/hOJ7HIdLiRygPTknTioPXRfmgAFFDSStyDjlAGNnz/G/FW3aJx0MCCv3IJx5YWYJohJV7aow8qlPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139826; c=relaxed/simple;
	bh=v61+oQu0Uub7mJelOV/BcV4e2C5pfDr6dV6Qg0I3fMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aj6pzBi3tH7qqBRYWcUmx6UUCJUuum/vgoa7CcXBN6iFwCfhwI0JUS5YJlShGqsayfu8kZiu24KeyG+v7vswv/v2tx9YZjOR+3bG1vjiSe5gQ0JFShTJPuOczoyiCGHJvAKinjaBdpJd9lnnJECc/iOQ6zIQ2WzTZP45b+HSi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN/O3vCB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN/O3vCB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so28380515e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139823; x=1792744623; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qblXGFHBRDlmSX/Am9ZFJWisiD8/1L6Ooxh/fKPw1h0=;
        b=mN/O3vCBSvoB/IGH0jdB0odGOr9YHQSEHt5YAenRdhBb2KBub8qXspZVHMinhpCow9
         U1ct8HDVc8xCsgkQUZhP2dHak2JN2GRgnwEewxZUI1V8WLxV3vYhKBCymf/ZyC+9TYZA
         SChAYJiX+tn02dfU1CWEIuWCMIH7G85+bSzFZETBn8BIpWbMBTEvXIGbISNhqv5sATgB
         Q4uoExeL3xwkn2QlplWzWP09DTfypoNpZlU7abV5DNIeLMXKxFA5DwXxBsObwk0sg84s
         rwDYBha0bPQFUIWsiKUhFvBPfBMQGf2EYEYCEjLSvzUhzNow3csLpO+vJo7J26g3aZzK
         sVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139823; x=1792744623;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qblXGFHBRDlmSX/Am9ZFJWisiD8/1L6Ooxh/fKPw1h0=;
        b=bFYfoeyMh3ntT2KuM5fGCwNEi6aqeaqcHnV/hwbru9MI9EkBoXVVpiqHr4M3oKDZCK
         UGaxzbdW1biLnh4QSdR2paONRh22j/xdwudt3jQHIMmrMi45bpv0AatSswDGdAHoMPu7
         ndHjzey8HCRqStqVU4Vn6y/YOIz0KRf81iyVQFiEgxEVzmGq6KqhWvgvQNhCWxHWin/M
         r31wOZYwNOAmlTSrH9bBSfcRIUXD90ggQn4cUG5O/TAZWWUqqsID9ADc9HOMsy84o9xT
         +zdN80BVT7CnNG7rjSmrzblVdLN6BPdmAVjkQML+rbQ74YvT0AHA9pBajkaOu+FR7Une
         z/Rg==
X-Gm-Message-State: AFq9FYK3CeEP365P241fXIpO5Jw4I8bs2xA4JcvDtO5h13AxDBqbcxiP
	+8O2DC68qY7EAtGbvD2dbXgrCNzZOghpaoShTuayPYao865LrWPYpi8Q0hsXFgwZcMZxow==
X-Gm-Gg: AYBFou2UpxbdNR10t3fWPCbkGA7c1UOKaekwsgEZqr8npCY601YosMzPfWsIAOx3Ii5
	U/O3B3TCv32xEJze5SEwxtjww4keKMnLzVRLtTEJjafLB+H5yQHEH9VskayacIzLCIxXNBMqye1
	sN6WQTXShBCIRbQ8h2L+hEhDrCaKqEDojf+exib+hRBhMPAzPXcQdcnKvirzXUSYJEt76NIBpTC
	0qjwDCsYiByAczwAN+KS8eg56PQZw/jGO0UsQStUoQkXjYVNcReuzX/iq7ROSS4hRPQNOTfiz/p
	MH2Apg7hoNtGXN9zp1MPR/WsCcpyhzWlnH74xe/I1Cae1yBMa2jGrF5GcIQZcL3BmuIhq2MjASD
	eENsRoZEA6BY7bu6bxRB6yo8cI+ZUftrgQrmK23hSdMeQ+cgPhHSt4xpRHLzoxWHj/yfqOtVubZ
	8t2DmK0IkWHOiLtBg28KdgB/zIqAsg9Zd5sB8qgcD3V7TnirXyKjcnitP2IvL6z8+2XICW3BdpH
	oUawg==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr431914885e9.20.1792139822886;
        Fri, 16 Oct 2026 01:37:02 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm129989515e9.15.2026.10.16.01.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:37:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:36:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/30] fs/netfs/direct_write.c:54
 netfs_rmw_read_one() warn: signedness bug returning '(-12)'
Message-ID: <202610082353.hZ3FyTnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261016083657.WR16368jw9xxw9ylAsa5-9-qkGGiV-gMhRc74eaWcdU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 870d31c7b4cbee9e73019466181a2e0c2c1094f8 [30/30] netfs: Support encryption on unbuffered/DIO write
config: i386-randconfig-2200-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082353.hZ3FyTnt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610082353.hZ3FyTnt-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:54 netfs_rmw_read_one() warn: signedness bug returning '(-12)'

vim +54 fs/netfs/direct_write.c

870d31c7b4cbee9 David Howells 2026-05-16  16  static bool netfs_rmw_read_one(struct netfs_io_request *rreq, struct bvecq *bq,
                                                     ^^^^

this is bool

870d31c7b4cbee9 David Howells 2026-05-16  17  			       uoff_t fpos)
870d31c7b4cbee9 David Howells 2026-05-16  18  {
870d31c7b4cbee9 David Howells 2026-05-16  19  	struct netfs_io_stream *stream = &rreq->io_streams[0];
870d31c7b4cbee9 David Howells 2026-05-16  20  	size_t len = 0;
870d31c7b4cbee9 David Howells 2026-05-16  21  	int ret = 0;
870d31c7b4cbee9 David Howells 2026-05-16  22  
870d31c7b4cbee9 David Howells 2026-05-16  23  	for (int i = 0; i < bq->nr_slots; i++)
870d31c7b4cbee9 David Howells 2026-05-16  24  		len += bq->bv[i].bv_len;
870d31c7b4cbee9 David Howells 2026-05-16  25  
870d31c7b4cbee9 David Howells 2026-05-16  26  	rreq->start		= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  27  	rreq->len		= len;
870d31c7b4cbee9 David Howells 2026-05-16  28  	stream->issue_from	= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  29  	stream->buffered	= len;
870d31c7b4cbee9 David Howells 2026-05-16  30  
870d31c7b4cbee9 David Howells 2026-05-16  31  	do {
870d31c7b4cbee9 David Howells 2026-05-16  32  		struct netfs_io_subrequest *subreq;
870d31c7b4cbee9 David Howells 2026-05-16  33  
870d31c7b4cbee9 David Howells 2026-05-16  34  		subreq = netfs_alloc_subrequest(rreq, NETFS_DOWNLOAD_FROM_SERVER);
870d31c7b4cbee9 David Howells 2026-05-16  35  		if (!subreq) {
870d31c7b4cbee9 David Howells 2026-05-16  36  			ret = -ENOMEM;

so ret should probably be false

870d31c7b4cbee9 David Howells 2026-05-16  37  			break;
870d31c7b4cbee9 David Howells 2026-05-16  38  		}
870d31c7b4cbee9 David Howells 2026-05-16  39  
870d31c7b4cbee9 David Howells 2026-05-16  40  		subreq->start	= stream->issue_from;
870d31c7b4cbee9 David Howells 2026-05-16  41  		subreq->len	= stream->buffered;
870d31c7b4cbee9 David Howells 2026-05-16  42  
870d31c7b4cbee9 David Howells 2026-05-16  43  		spin_lock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  44  		list_add_tail(&subreq->rreq_link, &stream->subrequests);
870d31c7b4cbee9 David Howells 2026-05-16  45  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
870d31c7b4cbee9 David Howells 2026-05-16  46  		spin_unlock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  47  
870d31c7b4cbee9 David Howells 2026-05-16  48  		netfs_stat(&netfs_n_rh_download);
870d31c7b4cbee9 David Howells 2026-05-16  49  		rreq->netfs_ops->issue_read(subreq);
870d31c7b4cbee9 David Howells 2026-05-16  50  
870d31c7b4cbee9 David Howells 2026-05-16  51  		cond_resched();
870d31c7b4cbee9 David Howells 2026-05-16  52  	} while (stream->buffered > 0);
870d31c7b4cbee9 David Howells 2026-05-16  53  
870d31c7b4cbee9 David Howells 2026-05-16 @54  	return ret;
870d31c7b4cbee9 David Howells 2026-05-16  55  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

