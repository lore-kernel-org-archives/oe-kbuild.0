Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F021ABB2;
	Tue, 25 Feb 2025 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495262; cv=none; b=HO7LCSVIK9gluNZtpOa9F+d49L3CeSW01r5f0NhJmR255YxDHavc7XPEpFInD7TrZueGWggmzt6IoaK5IiT0P6+vz3UlWGkx+7BA81kAjAMIcZ1UHCNvjH/r55rPBJq4V/yoLn+MfVOwA5W7yT2oe8mhBIQplZfOeOc+b5BOL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495262; c=relaxed/simple;
	bh=fGFy6TkVvvFSBJBtvwKKCIcuqLB8Gp5LhuAXcZ++iWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UydKlNedP1CfaaK71vuQzw3UbSAbE8qW1D4PeD+Krwfx196+/Od6kn16a8HHey4j4EOzTYicYmLhQ2wqCSt3mGfUkfeoyP2Caw5ejZEJ+X1j0S4sppxSttCQrqXjSIV7DfFWDXjAvbgOBaWUaehiTUk6bnh9w2IJ0lcKuEdNHEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OIurxDBV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OIurxDBV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E1F1B40E01B2;
	Tue, 25 Feb 2025 14:54:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ztTnc5zCCFJz; Tue, 25 Feb 2025 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1740495252; bh=HuKrRSoC93GtPlKMv4c20e2TYzpEJC46tpoId9qbscU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIurxDBVhcS4+EjQjReOOwB1cYXmA10MgPEVu6GE2gBeY/6KqWIIIzRXuv+XKH4xj
	 FlGpc0BTxAb75kNCXL0iCn3byCJzJ2PzomAdQPpFrBLUs9lLOwObvP5n13vQhNLz/7
	 FnzE4wTBdjQE6UNdNQNUwXDqDzDIp94jJ2THGxTxkS6ZVxp8khG+ZHe0ztOJ8C6Afk
	 KyxlTMy3f5CxN8gyR7NkPsEuXr72xHMDfgXdlWID2dQYyTysZv/aFkWGLruV/0ggfu
	 0SKa65WiUu9k+lfKLKPHJMHZiqrK8SUCLEKtG3kwPKpCUZ76R+WiCjnJQRbIgbTsqD
	 oRvwullyQ2+5UoTrhos2ffd4+cZO5mEUpNSgfNp/cFBAkMmOsQu2sy+zV3kunbrsWA
	 FMlj9YZjEy7zpN0qCpecuTgcGQRiU0BRZgVjuUKnzu5eWdeuMaTu5kZ3zGfJRAlYHm
	 8UAEhNL4AhwslasRyhZ219/amjmOG+h4QBEZv/FaLJcqMeZNclpDUI3kCYCKGmID3k
	 bukO2tzkoQQzVcq0iiY+ootiega5aIiVZlATij9ggfeau2jJxnaCid+4B2gCu1pYCr
	 cd1lNrARhXq9kGGgNWb6ZHOxG3ofG/PENMFEk4cTGQV5pIr6ZSTzuwPOpBYPpggSQX
	 i3Q9gHR+DbyikTEuPbPEHFKM=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5058940E01A0;
	Tue, 25 Feb 2025 14:54:06 +0000 (UTC)
Date: Tue, 25 Feb 2025 15:54:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Shiju Jose <shiju.jose@huawei.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705
 edac_dev_register() error: uninitialized symbol 'ret'.
Message-ID: <20250225145343.GAZ73Zd05zHax2bL02@fat_crate.local>
References: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>

On Tue, Feb 25, 2025 at 10:46:48AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git edac-cxl
> head:   4fab25b62bc682c0df886d97dcb106d4989c9ff1
> commit: e777719d5bec32af859990456f4b0e0e362f425a [2/5] EDAC: Add scrub control feature
> config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251009.0sGkolEJ-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502251009.0sGkolEJ-lkp@intel.com/
> 
> smatch warnings:
> drivers/edac/edac_device.c:705 edac_dev_register() error: uninitialized symbol 'ret'.

Thanks for reporting.

I went through the whole set and did some scrubbing of retvals. And that
edac_dev_register() is already a mess. But cleaning that up is for another
day.

So, Shiju, I've pushed a edac-cxl2 branch, please run it again.

Thx.

Full diff of the changes I've done:

---
diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index 081f77b1f125..16611515ab34 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -581,7 +581,7 @@ static void edac_dev_release(struct device *dev)
 	kfree(ctx);
 }
 
-const struct device_type edac_dev_type = {
+static const struct device_type edac_dev_type = {
 	.name = "edac_dev",
 	.release = edac_dev_release,
 };
@@ -616,8 +616,9 @@ int edac_dev_register(struct device *parent, char *name,
 	struct edac_dev_feat_ctx *ctx;
 	int mem_repair_cnt = 0;
 	int attr_gcnt = 0;
+	int ret = -ENOMEM;
 	int scrub_cnt = 0;
-	int ret, feat;
+	int feat;
 
 	if (!parent || !name || !num_features || !ras_features)
 		return -EINVAL;
@@ -646,25 +647,19 @@ int edac_dev_register(struct device *parent, char *name,
 		return -ENOMEM;
 
 	ras_attr_groups = kcalloc(attr_gcnt + 1, sizeof(*ras_attr_groups), GFP_KERNEL);
-	if (!ras_attr_groups) {
-		ret = -ENOMEM;
+	if (!ras_attr_groups)
 		goto ctx_free;
-	}
 
 	if (scrub_cnt) {
 		ctx->scrub = kcalloc(scrub_cnt, sizeof(*ctx->scrub), GFP_KERNEL);
-		if (!ctx->scrub) {
-			ret = -ENOMEM;
+		if (!ctx->scrub)
 			goto groups_free;
-		}
 	}
 
 	if (mem_repair_cnt) {
 		ctx->mem_repair = kcalloc(mem_repair_cnt, sizeof(*ctx->mem_repair), GFP_KERNEL);
-		if (!ctx->mem_repair) {
-			ret = -ENOMEM;
+		if (!ctx->mem_repair)
 			goto data_mem_free;
-		}
 	}
 
 	attr_gcnt = 0;
@@ -673,9 +668,10 @@ int edac_dev_register(struct device *parent, char *name,
 	for (feat = 0; feat < num_features; feat++, ras_features++) {
 		switch (ras_features->ft_type) {
 		case RAS_FEAT_SCRUB:
-			if (!ras_features->scrub_ops ||
-			    scrub_cnt != ras_features->instance)
+			if (!ras_features->scrub_ops || scrub_cnt != ras_features->instance) {
+				ret = -EINVAL;
 				goto data_mem_free;
+			}
 
 			dev_data = &ctx->scrub[scrub_cnt];
 			dev_data->instance = scrub_cnt;
@@ -690,8 +686,10 @@ int edac_dev_register(struct device *parent, char *name,
 			attr_gcnt++;
 			break;
 		case RAS_FEAT_ECS:
-			if (!ras_features->ecs_ops)
+			if (!ras_features->ecs_ops) {
+				ret = -EINVAL;
 				goto data_mem_free;
+			}
 
 			dev_data = &ctx->ecs;
 			dev_data->ecs_ops = ras_features->ecs_ops;
@@ -705,8 +703,10 @@ int edac_dev_register(struct device *parent, char *name,
 			break;
 		case RAS_FEAT_MEM_REPAIR:
 			if (!ras_features->mem_repair_ops ||
-			    mem_repair_cnt != ras_features->instance)
+			    mem_repair_cnt != ras_features->instance) {
+				ret = -EINVAL;
 				goto data_mem_free;
+			}
 
 			dev_data = &ctx->mem_repair[mem_repair_cnt];
 			dev_data->instance = mem_repair_cnt;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
