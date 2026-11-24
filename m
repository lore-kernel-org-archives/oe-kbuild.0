Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534730;
	b=YBcPeERY8VpJ+mvbxTtS+1pmbfqy9hvhmOYkumwFo4xthkHcA+vdy70+OQIxiUVsn+N7
	 Rqj1QvaJ1sWZfbg10k0a7LhM6MQIYaT27HMKzEoW0pvVsxM7QHo0W8U5YcLIS/0uZFypm
	 636M9idoNDehqsgKKpEBq8P8NxKrOdVSrbBsWGuKT90cJeiFQMFmpRn5f5QtET5zkEYma
	 OzKJmyyPv2vAI7Fv9ZwhU6fhYuneuT8WZOUGNb7RkFKUwKcUlkvuE9044LY25N0yE3ZZW
	 zqlTdwpsdB2oFSGhEFQVxUqcYHXlnklY3XM6DJpGz1yfhH9wL0qJVpzfF+B1YLbSfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=skBYKzkelwYLSQczcW0YFaliTs7tliWgpwZZ1Mb/2DM=;
	b=4FjDGLxCmQwNMjqlY/0d2ghIiefsUuaOfxCVtqXgKNhUc8Ik4H1asVmtf4rF1cz8+RQF
	 YN+wgrUnLqIaj9kiFbwaIkRLRfFRPh0Ppa6xpWyTzzZELEdBE/u28vjC2/tGLdt171fwb
	 qbbS3slfPZRwuVs81ryQmM1tcLG+kBxysFCivaouJWQJcz+ugz7MFRwj2j9IoQY1kPTXU
	 DdTWlOyrfAPymWc/X5zZr/UHWoPAyrox/6M/s86P3pfi2nEthE0NMV3dfo/6aEjb257Bs
	 CA3/4Oc/SIU4osiBmHbIQv7IYVIjV65d7/cZQga+gknGfjYAPSSDLVZQ6CJ4qDp8aAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb6TmTxR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA62606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 15:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb6TmTxR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so45427465e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534728; x=1796139528; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=skBYKzkelwYLSQczcW0YFaliTs7tliWgpwZZ1Mb/2DM=;
        b=tb6TmTxREGTogoN26kk+/H+owcJdjkI0V3NelH5gNCaAERn+hxe3xPz19jJTJfXCtO
         hSAe6mnfADARA81HYqInSHZF5maQ7tVnG4Uwo8VbCxlNzFmnLwSdgUxyt3rHHOHR4edN
         05rW+AaR2a/Ng8e1qWPTwwTYpFDmRHVDEZuzl2eu9gGnvfIp5bm2HgTC2ezrRPcj+cG4
         FibNIW77ioVw5tVInvU4zgA3JiZj+09nDpKlT2rdEfQQ2M6XfcX8INSVL/2a/czezU+u
         DnpE5CzIlB62ktP6+ZQCSeR8yO/0b1IegmzNG40ebrfRwqn6TADf8vh4sSwD2iZubdk5
         sBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534728; x=1796139528;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skBYKzkelwYLSQczcW0YFaliTs7tliWgpwZZ1Mb/2DM=;
        b=z4D0u3UsvXEjmOlvx8Ts+SBhUJj8FWvkF22vm7mRHXE0c+qZo2ENP2p2YHy072vtgI
         rWOmQFsdSvb+JkuZQee+d6+8pgOEkZeDDrFbRB00yq3FBCMNinheDJHmnAQdrhwcjigc
         6byRfNZe/mv5ch8QqLzTuJRly32bRcWwMDn1LJ6cZfTWY6kstZDKD/eE0uQFcbbmYakC
         HMp3wUckE3chDu2m2ENWIUj789jpniPWXofPXiEy8iFMmJDb6ULiTAL7VefAp/5v6QdW
         +0QJ/7ma+VzftzTVsZsbyTkeNQlp9IjQAKPiehe0aaphSg7UdroeTKKUDedYL6pfqBjK
         kerg==
X-Forwarded-Encrypted: i=1; AL+hErF3CpwkqY2VmRmm8lX8/j/UdwLl1J9XMEeISQlyotj6U2ta026wSsz0+XaHkHZOOsfJFavrFj8iQDA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fkRuoZhOKuom3LnKEpyPCaoN3z7itMZ5HetWbRuQTdytB6vnq
	uaYYixk5X29mplWMgU+Z1kDf6GuzQA0KMtiaX10dgfUsLAhK6pqCOxYg
X-Gm-Gg: AZFdTZcOcJ1VjVSb9DGT9VPFiju8y7wefrYykccFSZywPdc7WCZy2wciKceyxRT4hD1
	VBpQRNpiPRjdK8urlzhrtD2biqCsDmn+5rN2ToQa9Rx4Nyg6ywo26t74iRtPhEjLXcRew2cGdXu
	FpbY1yzejQT/ZkM1ZN5PIAvH6vddkBXQgpScghRs4N49CqIzbxmLZNqYDBCHJ7rkykH5mHEpjv5
	dGRvIXNhxvX6XxHv/6s5Ju0KPvaXMDWoHvYc2y7ZBQfaCaFZVbaUIHVtRKiCWx1byqz93me6dxM
	cdAj2CQS3lub4vBMryxR5Cyp1IwJqsC7YhyLci6rIFXio2jojQ7pCVpwNX/6aWh+vf1NQ0oVvFw
	QkBLyFZ1W2Lkpx3z23QvHuE5AchixwfULAob0mMPSbjBfU4n9OIzgq09g9VGXweWPmpnZ8EWoWw
	VFUoDsi5JawhZtWSuq96CmRoeC7WoGD5YroG62FvJZ5PDWrWxC0Wi4lakzJ67fFfPbuVGi/crNW
	qeAySuW7D6LCr/QVrlB/sphsA73UgUur5HsNluOY3oA5q471I8PfaqR45oEfY7XuHSwofJ2ejfw
	c/dykAUJGcoORK6rhk1xPqwPsBqSCp4PQZVDYAoPE+cvia9Gz4GN1bNAnhugLFZ3Ht/B3gvK4tb
	Dvb1T1i3mk8CSBQ==
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb887e220emr303365345e9.2.1795534727989;
        Tue, 24 Nov 2026 07:38:47 -0800 (PST)
Received: from ?IPv6:2001:8a0:c4c6:f00:d7bb:b9d3:9ea8:c2f? ([2001:8a0:c4c6:f00:d7bb:b9d3:9ea8:c2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm373963025e9.9.2026.11.24.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:38:47 -0800 (PST)
Message-ID: <b376063e85114da6e24e61c03edfdf9d58dfccbb.camel@gmail.com>
Subject: Re: [frank-li:imx/dt64 96/125]
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0
 (pci17cb,1107): 'vddaon-supply' is a required property
From: Vitor Soares <ivitro@gmail.com>
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Date: Tue, 24 Nov 2026 15:38:46 +0000
In-Reply-To: <20261124142225.oSpR9anc-lkp@intel.com>
References: <20261124142225.oSpR9anc-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 14:31 +0100, kernel test robot wrote:
> ::::::=20
> :::::: Manual check reason: "dtcheck: binding changes may go via differen=
t trees"
> ::::::=20
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Vitor Soares <vitor.soares@toradex.com>
> CC: Frank Li <Frank.Li@nxp.com>
> CC: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.gi=
t imx/dt64
> head:   65f8b4684f2bb651f3e5168da9b237a31fed25b5
> commit: 8a03967da41f55b803d31a6c5b5052bc35346eb6 [96/125] arm64: dts: fre=
escale: imx95-aquila: Add ath12k calibration variant
> :::::: branch date: 15 hours ago
> :::::: commit date: 16 hours ago
> config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/202611=
24/20261124142225.oSpR9anc-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.2.0
> dtschema: 2026.10.dev7+g0fcb8d81a
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261124/20261124142225.oSpR9anc-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/r/20261124142225.oSpR9anc-lkp@intel.com=
/
>=20
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (=
fsl,imx95-gpio): clock-names: ['gpio'] is too short
>    	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>    arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (=
fsl,imx95-gpio): clocks: [[24, 119]] is too short
>    	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>    arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@47400000 (=
fsl,imx95-gpio): clock-names: ['gpio'] is too short
>    	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>    arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@47400000 (=
fsl,imx95-gpio): clocks: [[24, 54]] is too short
>    	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>    arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17cb=
,1107): 'qcom,calibration-variant' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'


This is already fixed in linux-next by the binding update:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml?id=3D75bc72=
5cd92b2b4dfa76850ce5983aacb52d894c

>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddaon-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddwlcx-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddwlmx-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddrfacmn-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddrfa0p8-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddrfa1p2-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddrfa1p8-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddpcie0p9-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml
> > > arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: wifi@0 (pci17c=
b,1107): 'vddpcie1p8-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath1=
2k.yaml

The binding change to make these supplies optional is posted and
pending review:
https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Best regards,
Vitor

