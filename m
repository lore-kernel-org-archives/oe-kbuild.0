Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860912CD8B;
	Wed,  3 Sep 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756866622; cv=none; b=qJle7Ramnkp676stABtolJnvknOwplIGm5tocpOPw0rBEUiFO7i/jwjwjI7mDLgELSTZf57xSAINN3FNqA+UkW/dQAENVWIv5fp4bAsbGlBm/+eL8YcEcanpaWVHChMb8zJEYdBCpW7eHxmbosgkAzCovWpQGmxfv8nyE+wLeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756866622; c=relaxed/simple;
	bh=ycU7s97Elzp8D9Lnpn/nwPgh4p+h+fTr5P6Bub2JNp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLVQ/J72opRiYBobY2QDwmZZNukQ8peYDvG9gXS77iHXpgg1nvTTuI0H+mvpG+MtaPzRh6cca4YxmQ4fEzy4zr1712KpMlpiZJK+N2yqYJv4D1D8Y6f8LZug6jY3AgfwfgYGEgKGXFf2ISR/gJJoo1aIBUYSiNQdLtmpFqPdd/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ebccd6ec886d11f0b29709d653e92f7d-20250903
X-CID-CACHE: Type:Local,Time:202509031012+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fc1c0d25-1a5f-430f-9cce-28659ca7fdfc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:aa48c90d2685f52c421d2b43104888ae,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ebccd6ec886d11f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1902583084; Wed, 03 Sep 2025 10:30:13 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 15CAAE008FA3;
	Wed,  3 Sep 2025 10:30:13 +0800 (CST)
X-ns-mid: postfix-68B7A834-477631288
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 1AB2FE008FA2;
	Wed,  3 Sep 2025 10:30:09 +0800 (CST)
Message-ID: <9a649258-5eee-4e0e-ba87-af79189b8a09@kylinos.cn>
Date: Wed, 3 Sep 2025 10:30:08 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <202509022308.CeaKUqJM-lkp@intel.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <202509022308.CeaKUqJM-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/9/2 23:53, Dan Carpenter =E5=86=99=E9=81=93:
> Hi Zihuan,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm=
64-topology-Use-scope-based-cleanup-helper/20250901-170106
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git linux-next
> patch link:    https://lore.kernel.org/r/20250901085748.36795-13-zhangz=
ihuan%40kylinos.cn
> patch subject: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
> config: powerpc64-randconfig-r071-20250902 (https://download.01.org/0da=
y-ci/archive/20250902/202509022308.CeaKUqJM-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 2e122990391b2ba062e6308a12cfedf7206270ba)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509022308.CeaKUqJM-lkp@intel.com=
/
>
> smatch warnings:
> kernel/power/energy_model.c:454 em_cpufreq_update_efficiencies() error:=
 uninitialized symbol 'policy'.
>
> vim +/policy +454 kernel/power/energy_model.c
>
> e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  450  static void
> e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  451  em_cpufreq_update_eff=
iciencies(struct device *dev, struct em_perf_state *table)
> e458716a92b57f Vincent Donnefort 2021-09-08  452  {
> e458716a92b57f Vincent Donnefort 2021-09-08  453  	struct em_perf_domai=
n *pd =3D dev->em_pd;
> 3a096464b04b72 Zihuan Zhang      2025-09-01 @454  	struct cpufreq_polic=
y *policy __free(put_cpufreq_policy);
>
> policy needs to be set to NULL here.


Thanks for point it out.

> e458716a92b57f Vincent Donnefort 2021-09-08  455  	int found =3D 0;
> 99907d6054f2d3 Lukasz Luba       2024-02-08  456  	int i, cpu;
> e458716a92b57f Vincent Donnefort 2021-09-08  457
> e7b1cc9a7ea6d7 Lukasz Luba       2024-02-08  458  	if (!_is_cpu_device(=
dev))
> e458716a92b57f Vincent Donnefort 2021-09-08  459  		return;
>                                                                  ^^^^^^
> returning before an initialization is an uninitialized variable bug.
>
> e458716a92b57f Vincent Donnefort 2021-09-08  460
> 99907d6054f2d3 Lukasz Luba       2024-02-08  461  	/* Try to get a CPU =
which is active and in this PD */
> 99907d6054f2d3 Lukasz Luba       2024-02-08  462  	cpu =3D cpumask_firs=
t_and(em_span_cpus(pd), cpu_active_mask);
> 99907d6054f2d3 Lukasz Luba       2024-02-08  463  	if (cpu >=3D nr_cpu_=
ids) {
> 99907d6054f2d3 Lukasz Luba       2024-02-08  464  		dev_warn(dev, "EM: =
No online CPU for CPUFreq policy\n");
> 99907d6054f2d3 Lukasz Luba       2024-02-08  465  		return;
> 99907d6054f2d3 Lukasz Luba       2024-02-08  466  	}
> 99907d6054f2d3 Lukasz Luba       2024-02-08  467
> 99907d6054f2d3 Lukasz Luba       2024-02-08  468  	policy =3D cpufreq_c=
pu_get(cpu);
>
> Or we could declare it here:
>
> 	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_c=
pu_get(cpu);


Thanks for the suggestion.=C2=A0 However, I=E2=80=99m not sure whether to=
 keep this=20
patch, since Krzysztof has raised some objections.

>
> e458716a92b57f Vincent Donnefort 2021-09-08  469  	if (!policy) {
> 4274521fabee05 Lukasz Luba       2024-02-08  470  		dev_warn(dev, "EM: =
Access to CPUFreq policy failed\n");
> e458716a92b57f Vincent Donnefort 2021-09-08  471  		return;
> e458716a92b57f Vincent Donnefort 2021-09-08  472  	}
> e458716a92b57f Vincent Donnefort 2021-09-08  473
> e458716a92b57f Vincent Donnefort 2021-09-08  474  	for (i =3D 0; i < pd=
->nr_perf_states; i++) {
> e458716a92b57f Vincent Donnefort 2021-09-08  475  		if (!(table[i].flag=
s & EM_PERF_STATE_INEFFICIENT))
> e458716a92b57f Vincent Donnefort 2021-09-08  476  			continue;
> e458716a92b57f Vincent Donnefort 2021-09-08  477
> e458716a92b57f Vincent Donnefort 2021-09-08  478  		if (!cpufreq_table_=
set_inefficient(policy, table[i].frequency))
> e458716a92b57f Vincent Donnefort 2021-09-08  479  			found++;
> e458716a92b57f Vincent Donnefort 2021-09-08  480  	}
> e458716a92b57f Vincent Donnefort 2021-09-08  481
> e458716a92b57f Vincent Donnefort 2021-09-08  482  	if (!found)
> e458716a92b57f Vincent Donnefort 2021-09-08  483  		return;
> e458716a92b57f Vincent Donnefort 2021-09-08  484
> e458716a92b57f Vincent Donnefort 2021-09-08  485  	/*
> e458716a92b57f Vincent Donnefort 2021-09-08  486  	 * Efficiencies have=
 been installed in CPUFreq, inefficient frequencies
> e458716a92b57f Vincent Donnefort 2021-09-08  487  	 * will be skipped. =
The EM can do the same.
> e458716a92b57f Vincent Donnefort 2021-09-08  488  	 */
> e458716a92b57f Vincent Donnefort 2021-09-08  489  	pd->flags |=3D EM_PE=
RF_DOMAIN_SKIP_INEFFICIENCIES;
> e458716a92b57f Vincent Donnefort 2021-09-08  490  }
>
