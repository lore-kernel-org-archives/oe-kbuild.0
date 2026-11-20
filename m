Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.209.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207776;
	b=kddD3HYh3wOyB6B4nIGCoxqlADFYUvwHugVBASOoV/2Y2uozYVzwd2tuMuckpXdBgl4a
	 WWOTf20nkG3A8lXi/XQ74E9RibIjaJdu2AuwKiXgGHez0PvMZ+Fywt04ttObdPrAeqDSE
	 GxAhAtsIMXzCnCLttVv1FDpA29yTU2Bq0CC4QRxMPkl2NI5PS9cibq4GhzogAnIFLQyXp
	 IkZNOnd9YJzw75YGUEDMK/y9jo/9joJfd3frK7yYBRSpTawdlWU5iEFRDltlwUSML3QWL
	 Kn55FLFX35ViXcFoj+PkYbK1hscqT1Fna9/wPFhnAdqbzasn9m+Yj++WfKqE3SVeAbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207776;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Industry-Bottle:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=wGpqzD9JNY9RpOtVFshGt+AvUOfyvv/zbTsS9hx1rHU=;
	b=jAV/cpaiES6r6XAzaHtY00vh3hlJCU9AnyqSKc+T76femgE61NMBbT3bGxCBKMV9WdQQ
	 RTTKEPbz13mrLnCCzJ2DY6plufW0Klx2MM3jtiP8014OkxlXZ7yu8byHwJk+G83Aoq9+l
	 hwbDjGYmDEXqCMiwVbgRfXnizhCupV4897wh3YX68X728tL0LZLiq+ih0sW+3SQn0Tj75
	 C5WyZydAJuC5/RPq9Tac3hBDfhsnG0U4SqaCIMhZgoRTDg4Cqs6xh5Bu+z25r3rJYRx2T
	 +5j6jl7aZ0cvXIIgnE0L2boJDZ0yy8wVprE4IxECq2YCjbPu0Z4kiG6OnC6fLjJ1W8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stgolabs.net;
	spf=fail smtp.mailfrom=stgolabs.net;
	dkim=pass header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=qhunHOih;
	arc=none smtp.remote-ip=23.83.209.82
Received: from heron.birch.relay.mailchannels.net (heron.birch.relay.mailchannels.net [23.83.209.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4C606A68D
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 20:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F4C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=qhunHOih
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B853B401DE0;
	Fri, 20 Nov 2026 20:49:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a240.dreamhost.com (trex-green-7.trex.outbound.svc.cluster.local [100.97.144.129])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 22E36401DD1;
	Fri, 20 Nov 2026 20:49:20 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Industry-Bottle: 02df356d737d1a08_1795207760494_1206187580
X-MC-Loop-Signature: 1795207760494:2617741215
X-MC-Ingress-Time: 1795207760493
Received: from pdx1-sub0-mail-a240.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.97.144.129 (trex/8.0.2);
	Fri, 20 Nov 2026 20:49:20 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a240.dreamhost.com (Postfix) with ESMTPSA id 4jWSB757CTz105k;
	Fri, 20 Nov 2026 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1795207759;
	bh=wGpqzD9JNY9RpOtVFshGt+AvUOfyvv/zbTsS9hx1rHU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=qhunHOihQ+2yqVDygj6ehHu6jtHLQHnz2tmSeSFOazj42Ps49yhilmUoToM4jNVfe
	 IpvtHjtXAhlHcCGhFPXg44Dqmt0XYKDrhgfmvl/NkIF7K9Ios2ETid/23ExIXqwyW9
	 lUVuIlunjFJ4ae8E6rTsBP1PM2tTU6ouNuY7KZI3UR2WAzoC9UYi41Qi2X+L0Z2drC
	 jFJzT3egkuZ55TyR78Sh37KmrhCXWpAb7XIWTFZ4w+9pxNV2a8B+DdosW08y/WSMo+
	 Qlxpt6wYRvAIhs546bP0fNvezJFGMeahWs1YjXGXkkGqMb7DYdq7E3WsVA10EnUMH4
	 EPccJmEqBUb1g==
Date: Fri, 20 Nov 2026 12:49:16 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 7153/10560] arch/riscv/kvm/main.c:37
 kvm_riscv_setup_vendor_features() warn: impossible condition
 '(riscv_cached_marchid(0) == 9223372036854775816) => (0-u32max ==
 9223372036854775816)'
Message-ID: <20261120204916.pwwxbk6dq3bblmam@offworld>
References: <20261120205750.YcnKhuSh-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261120205750.YcnKhuSh-lkp@intel.com>
User-Agent: NeoMutt/20220429

On Fri, 20 Nov 2026, kernel test robot wrote:

>Unfiltered warning: this smatch report is sent as-is and has not been
>reviewed for false positives, so please treat it with due skepticism.
>
>BCC: lkp@intel.com
>CC: oe-kbuild-all@lists.linux.dev
>TO: Davidlohr Bueso <dave@stgolabs.net>
>CC: Anup Patel <anup@brainfault.org>
>
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>head:   909ef7a9a30fa139e69e555e3606680f5cca7726
>commit: 403daa3414a6ad1378082f97b3a8bec08a50c641 [7153/10560] RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550
>:::::: branch date: 3 hours ago
>:::::: commit date: 4 days ago
>config: riscv-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261120/20261120205750.YcnKhuSh-lkp@intel.com/config)
>compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
>smatch: v0.5.0-9187-g5189e3fb
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Reported-by: Dan Carpenter <error27@gmail.com>
>| Closes: https://lore.kernel.org/r/20261120205750.YcnKhuSh-lkp@intel.com/
>
>smatch warnings:
>arch/riscv/kvm/main.c:37 kvm_riscv_setup_vendor_features() warn: impossible condition '(riscv_cached_marchid(0) == 9223372036854775816) => (0-u32max == 9223372036854775816)'
>
>vim +37 arch/riscv/kvm/main.c
>
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  25
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  26  static void kvm_riscv_setup_vendor_features(void)
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  27  {
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  28  	/* Andes AX66: split two-stage TLBs */
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  29  	if (riscv_cached_mvendorid(0) == ANDES_VENDOR_ID &&
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  30  	    (riscv_cached_marchid(0) & 0xFFFF) == 0x8A66) {
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  31  		static_branch_enable(&kvm_riscv_vsstage_tlb_no_gpa);
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  32  		kvm_info("VS-stage TLB does not cache guest physical address and VMID\n");
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  33  	}
>403daa3414a6ad Davidlohr Bueso   2026-10-23  34
>403daa3414a6ad Davidlohr Bueso   2026-10-23  35  	/* SiFive P550 (ESWIN EIC7700X): H on a 1.11 base, no henvcfg/senvcfg */
>403daa3414a6ad Davidlohr Bueso   2026-10-23  36  	if (riscv_cached_mvendorid(0) == SIFIVE_VENDOR_ID &&
>403daa3414a6ad Davidlohr Bueso   2026-10-23 @37  	    riscv_cached_marchid(0) == 0x8000000000000008ULL) {

The config has CONFIG_32BIT=y, where marchid is a 32-bit unsigned long
and can indeed never match. But this is intended, the P550 is 64-bit,
so on rv32 the check is dead code and the static key stays off.
64-bit is not affected, so this would be a false positive.

Thanks,
Davidlohr

>403daa3414a6ad Davidlohr Bueso   2026-10-23  38  		static_branch_enable(&kvm_riscv_no_xenvcfg);
>403daa3414a6ad Davidlohr Bueso   2026-10-23  39  		kvm_info("henvcfg and senvcfg CSRs not implemented\n");
>403daa3414a6ad Davidlohr Bueso   2026-10-23  40  	}
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  41  }
>3239c52fd21257 Hui Min Mina Chou 2025-11-17  42
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
