SQLite format 3   @    �   a   *      +                                                � -�r   �    ��e �                   t!9�indexuniquenick_alter0_directcontactsCREATE UNIQUE INDEX "uniquenick" on "_alter0_directcontacts" (nick ASC)]	#!�indexuniqueidentidentitiesCREATE UNIQUE INDEX "uniqueident" on identities (ident ASC)�3!!�1tableidentitiesidentitiesCREATE TABLE "identities" (
    "ident" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "privatekey" TEXT NOT NULL,
    "pemcert" TEXT NOT NULL
)k-#�indexuniqueremotecertremotecertsCREATE UNIQUE INDEX "uniqueremotecert" on remotecerts (pemcert ASC)a%#�indexuniqueremoteremotecertsCREATE UNIQUE INDEX "uniqueremote" on remotecerts (ident ASC)x##�7tableremotecertsremotecertsCREATE TABLE "remotecerts" (
    "ident" TEXT NOT NULL,
    "pemcert" TEXT NOT NULL
)�99�Ktable_alter0_directcontacts_alter0_directcontactsCREATE TABLE "_alter0_directcontacts" (
    "nick" TEXT NOT NULL,
    "address" TEXT       
   �    �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
� � ������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             )bernd-december
nobody   bernd-p3)bernd-2011-apr%Bernd Stramm%berndhs-2011
R *J��]���|�<�*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          /Ukirk-tun200%xubu32-world �kirk-tun �154yk mobilewbarbados4i   xubu32-worldx7curacao.ipv6.berndnet~/barbados.berndnets#berndhs.dns{ mobile �kirkcuracao}-berndhs.freenet6|barbadosz                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              	 � 6��F�����~W                                                                                                                                                                                                                                                                                                                                                                                                                              1� Ukirk-tun2001:0:4137:9e74:3cf3:16a3:3f57:fef3 y'154192.168.1.154 S -Kmobilemobile.reflective-computing.comu/i'barbados4192.168.1.154 y 5�%Sxubu32-world2001:4830:1135:1:a00:27ff:fe6f:1032u/0~77curacao.ipv6.berndnetcuracao.ipv6.berndnetu/(s//barbados.berndnetbarbados.berndnetu/,{#Cberndhs.dnsberndhs.broker.freenet6.netu/+|-7berndhs.freenet62001:5c0:1000:b::6475u/1zSbarbados2001:4830:1135:1:216:36ff:fe63:6551u/   U+�Kmobilemobile.reflective-computing.comu/,Skirk2001:4830:1135:1:d8b:1218:cdcd:4f07 $}=curacaofc00::202:a5ff:feb4:fcf7    5 )
5 E                                                                                                                                                                                                                                                                                                     �Y%��wberndhs-2011enkhuizen-----BEGIN PRIVATE KEY-----
MIIJQgIBADANBgkqhkiG9w0BAQEFAASCCSwwggkoAgEAAoICAQDGI4bJWsz+A/3h
rAdKFzrnbefOqcNpE7Y12E7yHVWizsqGKyKHWpaYuwd9+d2Jlh+/1j2/qyF8TTCU
6EQqzUW+3dH5zIYOrgUrgdopnpJIBfrM0WOrtMpIGTSWskmQHBp   B�F��gnobodynone-----BEGIN PRIVATE KEY-----
MIIJQwIBADANBgkqhkiG9w0BAQEFAASCCS0wggkpAgEAAoICAQDb2IjbNxE9w4/b
k4iZHjLCPdKurPYhHgDOsvGjHAHk7FO0/QZDo7wjBJMXup9xI7EU0q81ygiCzvJp
OmR68d/RyohUHiDBoXvGq+t7QUCvz2JyHi8bEwUF0IZ   4�[)��wbernd-decemberenkhuizen-----BEGIN PRIVATE KEY-----
MIIJQgIBADANBgkqhkiG9w0BAQEFAASCCSwwggkoAgEAAoICAQDQo8KCS7hFm2j+
WDiH5kHusHHM/ytVnJob3Asui7HY3C7VhuIQQzjjy5WYrMX4pACF/wVODgrtUf/v
xF5y7f08nwHmrIgfEn544dIunHLdqNSxBiBdusxXdOgHN5e0So/   P   	W/EI/vrTYRO+3xscZeYEfxtHc91cwjBxhyNbWwKMD
q9AINg/RWMJUUot900vi6pSM8k8mUx9PQkoYd0MuNgKLFTdXbxij1hGmenK9Fcg2
DpB9y0FNjMhF9kurhrIS+AiVy2unA4eEh4P2C/DBGrcuwzmnJ/Aybz0BZIOOBKTE
lZqXWGp9QHZUz3vuv/6op5xtPFLQYgBogRDygr86F9jGcgMNXYakmxNLOYH9OCZ0
lMGXpODquYrDoViLv8CGoCwp4/BOlsDwFNWft/ECggEAcedoh1qCfghPWgw2tobt
M7KIeYiquTfb8JKl0x7y4wAw4O7bR34KhDplVuxkBwpiGwMBZeMDJ27blpeN5Mxd
ZUj6QQxKsPShN1NNz8K8Zaq95YfAebmI9/ABeF/ca1YpuYLWBBC5/fxfUbOTtVV2
3yWqOTyL/QMmb5kcznwm3XjXOmPZH8FW1+YwR7ofwj0Ua5rwiLWxpjUUw/z6+BuY
EBto18slwT/HUmkfaETauLU51TJ746MYB2UsuOpNPK043/L9AbRtGLCq8k9dwSZI
UCqmysCQBqtkxxKxkTQSzxukejVODi2YxJOJLoblkCZK7jTsFKwKaC7fD8MR84h/
TQKCAQEAwZzBaIRWX5RVmKine4D/W3kA2kWSk08CVlnZQ0G7HONruTrGNkgOXZqf
yHkVcNv0OJNuD1vAwKE+XNDBGdIdEfzYsptreg6JqnTfpK1SLD+e+HMSL0vPH561
gpLMFs6NPTgWbymEZUM9Jubi2uDpKx9nu+ND/vNjN3vlQJistEJL1sY0mNZHGdmg
GNErPyAcsPGoV4M/YNQYQzSdQPEB3u7HSr9OKj2++T9wNOtwAhAZJdlwNmWog6h/
v23Wb+UBY5IXi9VdKhmQrfHNqQXfcv1/tv+hUQDIRfaG/ftHFsVUUvzCOZWMEdN2
Y9BwZr8loGIzMh3+BTj0XmGj+9+iiw==
-----END PRIVATE KEY-----
-----BEGI    8iE2QEZtQQxTqvPl97Jw9DW0M
WogO17l9WzvUwvjiMCCjCko+CHhLAgMBAAGjWDBWMB0GA1UdDgQWBBQlh5X0zldX
8QbnRNNIMcK5i/Y78jASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQaMBiBFmJl
cm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAGK7nQDWQArq
0Yox/f78H3XljAxdxgay5mz5+TiH+rh586K3RPZ5fo7K18cudiymj7fXu/Dceoy1
ABxNWd3+H3ZeLbA2m9/EKHS8wCZAmUPwIgVj2hsYwtSvpxHBNpGciL/dCNTSOLk2
9bq3JZB5co68OmX1p3WpBNaMJ9JQhVpzrUPA5lXujrNnX0FDBG9YL3kO3OFsvv7h
YQdAwOm1lpypDqtcZrZSpp3Rx6GXNE+173PPCS/uKSsdeSJwfpDJNDicaB1baB+C
VRTeuAcxCGGRlFwD/a4RlMaUb1WYRb7w7qxpmi/ZVd5su3Rnttiz3xTMRWqRx4KD
bU5onMe+XdVMbJV9Re1bAc92VjxVf5QxHg79Wh2e46KFqi3bGz0nq03MLwCuMjKR
Df+WZ+EZbAT/pOpOeC/AbyQV6j8gBd0PYRsQNySczfr0yi7FXbN5orEWjP7lD5Jq
sIslM7SSDBMy28EMJYFAwIVE8JaPnh7L9gC+4jOpRZSTCDD3zLoBNH1IFkid1gN6
+9B1ZV1pdzXb/UMtjv989mtyXHM26dM6gznwFHvuZCnAhtrdiySsfHaZaQm7WeCp
lT7rzlUIvIre/92x3gTtj25MswUA6PAg1OZckRgsUEFijFZTXjBa0BAkJgG5D5JC
cg1U/Ygjdtf1CWrWk7ukf6XkqHNXxwvN
-----END CERTIFICATE-----
                                                                                                 � �h}%�      x##�7tableremotecertsremotecertsCREATE TABLE "remotecerts" (
    "ident" TEXT NOT NULL,
    "pemcert" TEXT NOT NULL
)a%#�indexuniqueremoteremotecertsCREATE UNIQUE INDEX "uniqueremote" on remotecerts (ident ASC)k-#�indexuniqueremotecertremotecertsCREATE UNIQUE INDEX "uniqueremotecert" on remotecerts (pemcert ASC)�3!!�1tableidentitiesidentitiesCREATE TABLE "identities" (
    "ident" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "privatekey" TEXT NOT NULL,
    "pemcert" TEXT NOT NULL
)]	#!�indexuniqueidentidentitiesCREATE UNIQUE INDEX "uniqueident" on identities (ident ASC)�%
))�tabledirectcontactsdirectcontactsCREATE TABLE directcontacts (
    "nick" TEXT NOT NULL,
    "address" TEXT NOT NULL
, "port" INTEGER  NOT NULL  DEFAULT (0))b!)�indexuniquenickdirectcontactsCREATE UNIQUE INDEX "uniquenick" on directcontacts (nick ASC)u!!�5tableblackcertsblackcerts-CREATE TABLE "blackcerts" (
    "ident" TEXT NOT NULL,
    "pemcert" TEXT NOT NULL
)    �  �|t�4�                                                                                                                                                            ]#!�indexuniqueblackblackcerts.CREATE UNIQUE INDEX "uniqueblack" on blackcerts (ident ASC)g+!�indexuniqueblackcertblackcerts/CREATE UNIQUE INDEX "uniqueblackcert" on blackcerts (pemcert ASC)�))�ctableserveraccountsserveraccounts5CREATE TABLE serveraccounts (
    "jid" TEXT NOT NULL,
    "server" TEXT NOT NULL
, "pass" TEXT  NOT NULL )_)�indexuniquejidserveraccounts6CREATE UNIQUE INDEX "uniquejid" on serveraccounts (jid ASC)T!!utableircserversircserversCREATE TABLE "ircservers" (
  "name" TEXT NOT NULL
)h+!�indexuniqueircserverircserversCREATE UNIQUE INDEX "uniqueircserver" on ircservers (
  name ASC
)[##tableircchannelsircchannelsCREATE TABLE "ircchannels" (
  "channame" TEXT NOT NULL
)m'#�indexuniquechannelircchannelsCREATE UNIQUE INDEX "uniquechannel" on ircchannels (
  "channame"  ASC
)   	GA1UE
AxMMYmVybmRocy0yMDExMQswCQYDVQQGEwJDQTETMBEGA1UEBxMKUmlkZ2V2aWxs
ZTELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMF
QmVybmQwHhcNMTEwMjE5MjExMDMxWhcNMTIwMjE5MjExMDMxWjBtMRUwEwYDVQQD
EwxiZXJuZGhzLTIwMTExCzAJBgNVBAYTAkNBMRMwEQYDVQQHEwpSaWRnZXZpbGxl
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMYjhslazP4D/eGs
B0oXOudt586pw2kTtjXYTvIdVaLOyoYrIodalpi7B3353YmWH7/WPb+rIXxNMJTo
RCrNRb7d0fnMhg6uBSuB2imekkgF+szRY6u0ykgZNJaySZAcGnO/vkdsD8+VIBsv
tvoqGyWXbCoQLXxcDJnSpkDFDEwOJcDUmNK5Kkr0PaB82tZdShpHHqr4V8t7UoJF
rWViFLZXyIaWmocBme/NxCNiwwNfvDpg21RKCh1vA/yU687QTTJAXUYRgs9Xlcp+
10FQlamcB+uWepJJu3uH9qjXsnCiJlfn1e4bAXjVFew/h25PvXhmNsMiN/lz2X7T
QgtthtT05nalztuCS2fWRz3OHW6UMFlX3FLnKZ5H61dWRJImtgx5ByHVsSl2Pv4f
HrikiDcYVvZOuw27qpQo8rXnaTBlPbITohVW6auHo6DCtl3rFNGONpCsp5y6THzE
+ha7bs+iU6XGS47YBH0YN6jZ7SSPKGhi9dM6HB1rM9GvKIwouvO3Ok8Mbs2yxNvu
yY1PXgoo5i+q11M+/6OvuHIkoL2O+Rz+mo8kiLhtF0O9eZd0QZ6ygzj6/gLvoESx
rIy3m+3goLT+XLMbldPnRYUQuhSPCIUNRYG1RWi   + +                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               �H%%��OBernd StrammI am in this-----BEGIN PRIVATE KEY-----
MIIJRAIBADANBgkqhkiG9w0BAQEFAASCCS4wggkqAgEAAoICAQCj64fC3rck1k4z
WdllexSyoKprwiOCBcZ2QWJFr9wkQfoPVHwDwBWIk06kbTyP53WOcz+PGZt4ZoRj
SHyjEZqj2shxRamCYxRMtaNCQr5E638   "�W)��obernd-2011-aprenkhuizen-----BEGIN PRIVATE KEY-----
MIIJQwIBADANBgkqhkiG9w0BAQEFAASCCS0wggkpAgEAAoICAQC+nyU8K8FIdNUs
jBZz8HRY4vT7kXj700/INGhKne4+R2hLu2LQ3/2/4t4/k3clJKdYa6f/FIXC8xE0
+l7h5Sz/0PehAaw1p/qvlVASyAg93b1Qbc7cMA0L0xxTei3   :   v ������v                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
7irc.servercentral.net	/irc://irc.oft.net'fiji.berndnet+irc.devnode.net%irc.oftc.net+irc.stealth.net/chat.freenode.net
   o ����o��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         7irc.servercentral.net
/irc://irc.oft.net	'fiji.berndnet+irc.devnode.net%irc.oftc.net+irc.stealth.net/chat.freenode.net   /� ���������o_A7) �����U����M���j^RF5y$�������                                                                                                                                                                                                                                                                                                                33#sailfishos-porters2/#sailfish-porters1##sailfishos0##afraid.org/##necessitas	.#qt-qbs-'#openSUSE-arm,#LXDE+%#cyanogenmod*'#fedora-devel('#ubuntu-phone
'#android
&#pokerth
%#qt-chat$##fedora-arm)#vbox"#SUSE!#kde #xfce#e6irc#qt-quick##nemomobile#mer#razor-qt	#marssa%#sourceforge!#fedora-qa	#fedora#carpo-#opensuse-moblin!#meego-bar#wetab
#osm-dev#osm#tizen%#ubuntu-motu)#meego-meeting	
#opencv	!#telepathy	#qt-qml#qt
#qt-labs!#cross-lfs#yocto9#opensuse-buildservice#meego
#egalite    qWxhFvucBlEIXQ1u0CrvxURLn
dw46dz4LjjmIcgJGw/BTEKOgjj5kul0OuwIDAQABo1gwVjAdBgNVHQ4EFgQUGBhY
8yqR+lhb3i2Du7JUkzSBJA0wEgYDVR0TAQH/BAgwBgEBAQIBCDAhBgNVHREEGjAY
gRZiZXJuZC5zdHJhbW1AZ21haWwuY29tMA0GCSqGSIb3DQEBBQUAA4ICAQCr3X0v
04nBw4SMpY9AEbNAcXxKF5LTB88UDLyudzXXSvDRz7XaS3EpdOu1k24PkDs0SYoQ
EEcqc2Q2Lk8PnXVIMH4RPPe7LYumy4S82R3l0AWgJDtUxbpJuBI06WJOB5s0IOkS
wR9IDeNHPt+xnIcUvXyTyI/bXuUARXwMVGtQVwuMN1KtxDZsrbuKWe6dgBFx32Aj
k/RxZc+x6IdsHSepJwHHj2l/wYmf18jwvw7bdUCkH4kdgalhYfIEouIer4qxbFsK
DGIFtOts7ppCc63nCaq5nNf3dMKrdIwRTk7lDUEXL+ghkW0FNsKWchAPrGJqfM32
Q6NQ5L5K7OC5P82bj+JLVwwO3VmdEbxgfvRiwR5RQn5YCiAocUWI6CMPB2KeBgJt
dWZNAOOBQSaYX4JW3eHHrVsq1iUslnXWTetrEF43AnB8g8tfI95Oqo3RG1M6deLC
NGBC21S8HeuoVHotd4f+FpCPZFvGVnSQ1Z4az00rfvvWTYxWuJA/jkFjffkBQuDH
78MXVQznMhKh3UaXbmf4v4U/L7C1WdOcY2g4h6H1ZBb8zGGU6oMS5FGuLwUk4WIY
47McTCCtQ28zwXPNHtk76jn2bUMtz945TaCwC+RsXqqruXjsJPVsjwZWu3BMKEXt
sTl521zB2M/MRfOsJ35L2dzGCyxpeshGSpAEVA==
-----END CERTIFICATE-----
   GA1UE
AxMMYmVybmQtYXJjaDY0MQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFuZDEQ
MA4GA1UECBMHT250YXJpbzEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQL
EwVCZXJuZDAeFw0xMDA5MTYwMjIyNDdaFw0xMDEwMTYwMjIyNDdaMG8xFTATBgNV
BAMTDGJlcm5kLWFyY2g2NDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQx
EDAOBgNVBAgTB09udGFyaW8xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UE
CxMFQmVybmQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDlHLa6igFX
NzDi4Z1boQh8RVLZMU+K3ldfeGOmhapB+0ApkHVehx4e3FAEZmEg5Iik4HZQ1BEK
SYU3F9x1ugfdUklyq1U+VF8IfeoxKAzrq6CZcb9C06rXf1KZCngRqA31VcvkoOka
u5HKvQmaLYynx/77T/eidOYl4w17LMTdOK4qX6L8/CxThznt58D5/GZmVrbH4Jvq
t2U2+MgPaTkPRQ0bdhWg7qmrDEPdVpHBZUZn1gzCmLOLiN/IqP6HDGVgWr3hcs7d
C+/XWVEbTVc/UiUVsvkfAK3cRPmn/c+PiQ6p7FrRmJ0PI7zVXOfjOmrRqG9V1S0Y
CkrFXh/EskV/RiXdZMl0hNnm4RrhnE7q0bUsKdJ7DWS+m52/jH0xzEtfV4Llo3bv
tam/ebS0dym+/48eWjPrazOWVXl+qJdB9rso5G+j+Xb8m99NJoDVEcvs80zZgp+N
GR0HOAk/TXOoMXNFpZyKqvN5T1b0EsGBTxjN8KPFElMNUZEgLUUrugRqAF7inHTR
vmnwD87J/py8JqqOS+/uxu/ZA+SAZJ90NaYotZQBe1Q4+igkDGUtr/tVoco7WOeQ
TWV9VFXkF3lAYf4T84oqk+nvR7T2VHrKchY8wK+   	 " � � �H�l�$ "      �%�wberndhs-2011-----BEGIN CERTIFICATE-----
MIIFtDCCA5ygAwIBAgIIAsp1YLZ8LgEwDQYJKoZIhvcNAQEFBQAwbTEVMBM   �)�bernd-pirx-oct-----BEGIN CERTIFICATE-----
MIIFvDCCA6SgAwIBAgIIAsog5SrPz+owDQYJKoZIhvcNAQEFBQAwcTEXM   =�%�bernd-arch64-----BEGIN CERTIFICATE-----
MIIFuDCCA6CgAwIBAgIIAsogwkrSn6QwDQYJKoZIhvcNAQEFBQAwbzEVMBM   �w!�_bernd-arch-----BEGIN CERTIFICATE-----
MIIFqjCCA5KgAwIBAgIIAsohxL3FBTQwDQYJKoZIhvcNAQEFBQAwaDETMBEGA   N�'�obernd-aru-oct-----BEGIN CERTIFICATE-----
MIIFsDCCA5igAwIBAgIIAsoho9p4SKowDQYJKoZIhvcNAQEFBQAwazEWMB   a�1�bernd-barbados-nov-----BEGIN CERTIFICATE-----
MIIFujCCA6KgAwIBAgIIAsohocSpUcUwDQYJKoZIhvcNAQEFBQAwc   T�)�bernd-pirx-sep-----BEGIN CERTIFICATE-----
MIIFvDCCA6SgAwIBAgIIAsogplxlIn0wDQYJKoZIhvcNAQEFBQAwcTEXM   ]�-�bernd-samoa-2011-----BEGIN CERTIFICATE-----
MIIFtjCCA56gAwIBAgIIAsp3QEZKYYYwDQYJKoZIhvcNAQEFBQAwbjE   %�+�wbernd-maui-2011-----BEGIN CERTIFICATE-----
MIIFtDCCA5ygAwIBAgIIAsojdZvmN0QwDQYJKoZIhvcNAQEFBQAwbTEY   !
   /g �c�"������I��m��d����w�?2/�<������g��HSY'v�                                                                                                                                                                                                                                                                 3#sailfishos-porters3/#sailfish-porters2##sailfishos1##afraid.org0##necessitas/#qt-qbs.'#openSUSE-arm-	#LXDE,%#cyanogenmod+'#fedora-devel*'#ubuntu-phone(#android'#pokerth&#qt-chat%##fedora-arm$	#vbox)	#SUSE"#kde!	#xfce 
#e6irc#qt-quick##nemomobile#mer#razor-qt#marssa%#sourceforge!#fedora-qa#fedora
#carpo-#opensuse-moblin!#meego-bar
#wetab#osm-dev#osm
#tizen%#ubuntu-motu)#meego-meeting#opencv
!#telepathy	#qt-qml#qt#qt-labs!#cross-lfs
#yocto9#opensuse-buildservice
#meego#egalite� �Mv'�����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               !%berndhs-arev0ltedBernd Stramm!%berndhs-erev0ltedBernd Stramm(9bernd_bipbernd:zuiderzee:difoltBernd$#%berndhs_devzuiderzeeBernd Stramm&
'%berndhs_meegozuiderzeeBernd Stramm###berndhs_osmzuiderzeeberndhs_osm                                !)rotevazuiderzeeBernd H Stramm %berndhszuiderzeeBernd Stramm
   � ��������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     berndhs-aberndhs-ebernd_bip#berndhs_dev'berndhs_meego
#berndhs_osmberndhs
roteva    �  �$�yv                                                                                                                                                                                           QstableircignoreircignoreCREATE TABLE "ircignore" (
  "name" TEXT NOT NULL
)��]tableircnicksircnicksCREATE TABLE "ircnicks" (
  "inick" TEXT NOT NULL,
  "ipass" TEXT NOT NULL,
  "realname" TEXT NOT NULL
)c'�indexuniqueircnickircnicksCREATE UNIQUE INDEX "uniqueircnick" on ircnicks (
  "inick" ASC
)f+�indexuniqueircignoreircignoreCREATE UNIQUE INDEX "uniqueircignore" on ircignore (
  name ASC
)�##�etableircmessagesircmessagesCREATE TABLE "ircmessages" (
  "inick" TEXT NOT NULL,
  "partmsg" TEXT NOT NULL,
  "quitmsg" TEXT NOT NULL
)i'#�indexuniqueircmsgsircmessagesCREATE UNIQUE INDEX "uniqueircmsgs" on ircmessages (
  "inick" ASC
)�//�=tableircchannelserversircchannelserversCREATE TABLE "ircchannelservers" (
  "channel" TEXT NOT NULL,
  "server" TEXT NOT NULL
)
� 	� �������{jR``````                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  )bernd-drag-sep bernd-curacao-sep)bernd-pirx-sep   ubernd-barbados-sep   �bernd-tobago-sep   �bernd-ivi   �bernd-mandr32
� �bernd-fedo32	� |bernd-x64� nbernd-%berndhs-2011-bernd-samoa-2011+bernd-maui-2011!bernd-arch'bernd-aru-oct1bernd-barbados-nov)bernd-pirx-oct%bernd-arch64
   	 + �L& + �r��                 �z�w-----BEGIN CERTIFICATE-----
MIIFtDCCA5ygAwIBAgIIAsp1YLZ8LgEwDQYJKoZIhvcNAQEFBQAwbTEVMBMGA1UE
AxMMYm   '�~�-----BEGIN CERTIFICATE-----
MIIFtjCCA56gAwIBAgIIAsp3QEZKYYYwDQYJKoZIhvcNAQEFBQAwbjEZMBcGA1UE
AxMQYm   #��-----BEGIN CERTIFICATE-----
MIIFuDCCA6CgAwIBAgIIAsogwkrSn6QwDQYJKoZIhvcNAQEFBQAwbzEVMBMGA1UE
AxMMYm   1��-----BEGIN CERTIFICATE-----
MIIFujCCA6KgAwIBAgIIAsohocSpUcUwDQYJKoZIhvcNAQEFBQAwcDEbMBkGA1UE
AxMSYm   ;��-----BEGIN CERTIFICATE-----
MIIFvDCCA6SgAwIBAgIIAsogplxlIn0wDQYJKoZIhvcNAQEFBQAwcTEXMBUGA1UE
AxMOYm   [�v�o-----BEGIN CERTIFICATE-----
MIIFsDCCA5igAwIBAgIIAsoho9p4SKowDQYJKoZIhvcNAQEFBQAwazEWMBQGA1UE
AxMNYm   R��-----BEGIN CERTIFICATE-----
MIIFvDCCA6SgAwIBAgIIAsog5SrPz+owDQYJKoZIhvcNAQEFBQAwcTEXMBUGA1UE
AxMOYm   @�z�w-----BEGIN CERTIFICATE-----
MIIFtDCCA5ygAwIBAgIIAsojdZvmN0QwDQYJKoZIhvcNAQEFBQAwbTEYMBYGA1UE
AxMPYm   0�n�_-----BEGIN CERTIFICATE-----
MIIFqjCCA5KgAwIBAgIIAsohxL3FBTQwDQYJKoZIhvcNAQEFBQAwaDETMBEGA1UE
AxMKYm   _      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	frigg
      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
frigg� ;�f�;�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ))-berndhswe are the catyou just wait...+#))berndhs_osmparts is partswe are the cat"')berndhs_meegowe are the catbye   )bernd#berndhs_devbyebye   ")!rotevawe are the catsleep fast
   � �����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
roteva#berndhs_dev'berndhs_meego#berndhs_osmberndhs   )kRa7Lz5V
pevcrgz/tUziSSg62pe3XRoLUVn8fOK/1i9JuBqYiYzs9ntqL6PZCI5fiGr27S/M
nsUhyWYdFa/YK9pZP5/cKI7RS+UL1nE2O5lfQ2ScS1fh0Ojd5Mv5M9Son7uKcKe/
/qW+GY2kOkPFunIxIs2/GGWqIAomI9yWkhqlfKoEHU3U34hQv5Glmp9/+jq1j9vc
kNzWsd9Feb8RZv4utb6gUQ/XMKManwUJsenIUV2few2onuCgqLG7kWCGMMfSW8Of
OJ6/cReW3i6TdtyYMyGSIIxFxzCEy1Ai2Pmzk/UtAoIBAQC+4j2vQ7U3hZJ+cdRS
M19y/2Er8Ev0BwoSHi23r2QD9g455b4Yzcv1h+Yx0aVQypQRfHk1ZHJ9ET6ySbwa
TkTAki8o7W5QyUHsxVCPMaQ6U8vNfwsLVsQ6Z4n6YCnHLzx2ukvrmTYT3hPt9AbC
8uCcuoarepWutZd6dHDXji6QXlwWzTXf7tN0QZSVOO2hmZ0TJWxzw4gvz8TTX1EO
DMl49YaB6B3Ua82JZx8NrdB9QH7D2sIqKL7lht1c8XjkMoGE7rDRMw8tO4cJnTl7
OEy7GBEtW9Y3ZQWFK713Xl+BOzI0MXKTRDE3iPQlwdDD2Bb1rokYJ2+ml1K2OFSt
RYTTAoIBAQC0R7OKycct24+XsamarH0UP+tNt1A9FISatGCQG6FNigrLRHtH8XiR
KzVZa8Yc1GdIE+YaTn21c2KT2CmrHtpG+fYYFP5MNEPcY+7npzteQYk0CvtOX9V2
TSPtOnu0ggD48s41e/MnocPtsy+q+xfmgLtvpe7o918gkmQBvnGBtkXWHNZQODZn
tslX84hsOicvb27w+8E4LT/L3BGGIm9VfKvMCQf6IYkZ4qEuUx6LKQSQoFsxGPhP
SMeEsHVywZmuLFBcdk2As/YPfUOFQeL/NxNqJgBDuGCmNGTny2bU9Q8SyJdRb50K
6Qnkbyn6MnFNXGcmgOLVpEd6fYTL7PBs
---   0xppcWqcVAmAVbAbVYrTz3Cr6IEZrHLKRt/U3U8kBA4yfN6xRG3Im
DqEtZGwTLwCwtn/auDaMbMLM80w/wTywI6lKuB5+dXMByIi62JTb5kltQCVHt6wI
ef/MQ89VizHHzkyXI3MXdguWJ0S++t5nZ2Rxfy3N2EdmhYaoomw3Bj4wI7NHnRlG
6RpX52Mqlj1qPnky1p59kEBwbD9GU8KOTfiDjSJOFBaItkAosNmPgvvyTh3d8Znq
xW1tNZLmFFxRXRTBPsMBAoIBAQDTgzK3QlNrM31bufRurb8aa6JYMVc1Sm7gMnZU
X5gelsjz3qUWLeBNSn1PwAb3EeyLE9ARsdPbS7QYsPnT9PL1XWcjGgSyWH2aak+M
8bCyiNybwgJ1RGNlw0uPASlyx8/h/t0fXSsKAUvWWfAzxi2Li9sabogEarl0AFSQ
sVMKDgXFFbLaHcnUyCjgeFi3Z098lvOwQ/wtC2e4DvEdOILbKr5ReeDLvorLQWo+
S7TA3eKT8uCOw8w5/K4wpDxjhRpb7O7BHg9Ujr9WaX0yADSHN55T2KkH/pkJ4Jba
j8zF/OTnm0fTd+nNja24EAgIcqXmrN9lvPRZA8SARwvzxO1NAoIBAQDGZbyJs+05
QrmtfrwAA9bbpYM4A0/+lUKj/6A1g71yW1l+RK+o8CQQ2zhGFx0j2EftIa4aKTEW
PDlsCGwC0bFF3QKhnNhKYGLTzewAtQ4Znk1MbIAPd7bDZ4KKBcYcUXUVrdyc8iiH
4QN+6OO+Hy/N5ZE6eO8vVPzWZbs3YsqLftSfyeAiUUkpHHWnBSv5tk57XAZzt3C/
AyH/optQldOM+DDIMtRYdvsMNf/ItQBTN3icO6QFhGD+RgeTOJ2EOdpk/Oz0T5e9
4e7hOPxePyoabvnIKeF1PGt3tF2ikE9xheYaaaBwmglP+kQc0T5jSRH0yuD01U8R
TasD7A2VPYuPAoIBAQCQt/72Zro+6h8GqMg3BkhwYl7U6wWZX9FXMw/F    4eO84i78IOR2dnN47xm7iGvlLkQp
/TXsu9N8aq+sa+VdpLbaW4od4BTPAgMBAAGjWDBWMB0GA1UdDgQWBBTfc9Gi87Cx
Mk/5qdw4ZUuTa5/c2jASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQaMBiBFmJl
cm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAAz+MpddY4xv
AtGkbIrU/n/rXFLIHQCPdYVLWwxm5tghu0wMpavtvHaSz5uBZudLQqW1dpIKxoGU
7NyF31YIxx/ZEB9jbL0479xmf+0ihaESbOiYDZAepJik4s1AeFVCsK/QbCwbbfTu
Huyt9J0ggHimbI3/+QOSGXEF4QqDFPAc7qB+n1P/N1DMT7Cftp/i70Tj6nB27w8i
xVITRliBPaevekcJ9smdRwOnKXIWE3UT5p7KNZMSA80ESTJAEaeKM1DvX2NgO9px
Z4ksFZOwR7CvQ30kY6IaF1Vw1czHUgu0wIviY7orMZ/Ka7gHwmMu24Qf7h7sEajh
zB1CGMK2yWbYYuRd+1jIRENmYpyd0ET6GH9IXgkzDwSUkj1/uesifJFLsuk45B5V
8bCEpwla8K/h/VPC6ValW7JeEY0wq5xZYvHMoUe4TzDUZqAqqXl+GIA8ewGV364W
j3NOXEVYlTjxF/QxwTF2+SR/D7EODWRomT1aKOwktrALitb+Ip/uOPON9unapLOj
ZUvqBpuzFf9lDnU16vlvA/VFFeWEJQQGFrhMLqJM/KG32BE1TZkSaGrsVsjugx9u
YdeAEHz/9MXCPZ5nD/9I/8DUrrZftkZaiV3+8CAV7W2gHL0ZvzosoInuAyHubtDC
PnKy4r0lPnAjCC62jdqbS9eHqz4yfK2I
-----END CERTIFICATE-----
                                                                                           MBYGA1UE
AxMPYmVybmQtbWF1aS0yMDExMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFu
ZDELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMF
QmVybmQwHhcNMTAxMjEyMTkwNTExWhcNMTExMjIyMTkwNTExWjBtMRgwFgYDVQQD
Ew9iZXJuZC1tYXVpLTIwMTExCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAKnjim0+d6nGiyUU
uO2hV39OGhGe2HvvUCXTWv6oBoinaDBlvisop3uSiHCknoDFyVkXen5H46/YZ5lr
wtvcskIkVz10w7HZQkar5s24GWeDPKSaC2wE7sZjtI5Gem/tRGR0T9z01am+8T6I
fODFJlRjFkQiZBE7dtIfBMgfW3q5VpZYSvFQd3jwwzy86Oi7jhsOTVUq1SmYBr0s
CzoKSY2DZWOR6LLqZYfcXAEOUC4MFN08cf6BOL7v25rR4oeYJpVM5ihpW/RJfsJA
I0B9u/mIXbRFQcdpNtqSb67NYxdNZWYQ9CTvNpp72yoltTPeicmPnyB9z+gRZsjf
toaq+21REwg18YozlBZB1nqaWQmRwCF3Ta+B1AoAZJq6AehKqgBfKqX9O2L4p3U6
WP7hu8zRi+Qesp1JvAER0mnxSy+G/xC/M94M4qOiYlOBiPjXwu8zUeOcKBU7BYFv
fw/rvbDKcjMgpoFNCTlurhQ/PyVC5TXpzjkMx35vCIp+5L0EIPQlz8uOeBqV9qWH
TUoxSmz4z6Kzo1DrfZMTm7dguN6t9WaSt1S0UPSM55Xw/QKBzZmJK5i9F6sI2IxM
IzzV143kLX8jY6K6n2T7sm0CLP/HPlnPDC/h   7PuNkrPrTxOHg8w1ep+oDvl8Jixx6WLRR
/8Rcli0GQ2WfnjRP8S3XwLk7vJMgcLYDnX+/3urwGr1WcHWncP2v/OJ4cKsrIzNe
G4ZXqhoYZyPx1jxtNcgzk95yVOm/gbUdQmi1QixYkOYQMlHZ0ahFm7Hih2SBY97d
AWLMcZN6WIH4xZYglw2tnnvQVKWEBjJZRjiWw0gYBLQbIUG6KIiGmP7e7RKA8T8+
U+eqt/qBQF9pZsWileYF+8RxwHk5FPr5RlVVMvc4TibHHb3x1jsX/KJ7pdZb6Qp+
EBqk3N6Y1p/Le8fcH4D6xcZkrzrntHJ9lbzYLBu4TxKwLG1C8lbuQ8QgKOoajd4z
0ueu9/H+L/keH6sxhRTq3UO/FqnGvfgQ088hBMxaoPLzAP6AqLBI+uD7v/BHbSiA
o4K13KHspcGB0vQUb+MaHV5qo/jlI1D8pTo6Z2EMPT/1sbzpXz5OdNBbFpJnzOJH
b8aF/w2mJzzLYydbKBpJw1u7QKkAmg/cgodgefWWZg4fyhe/h9IpW9SosyTA4/i6
jkMErpkRW8ILJV7SxAZvn+n8dDJdAwIDAQABAoICACHbI8878NfK65vvktdC9KNw
S8K19l+Ekdka6BE8oVtbxSolaPfdVJVA151ecoPGaqFhbF9CCrpzciSPdC66FBaD
uaKroLctf6PYYD/vSR0zBrRV6OGCWMwkfgLYMIq8Y7kiOL7f3KHocFX/Xa9B1UrV
4Md3BZb9WVqWk6ui50BsByv3+8rFYAD3hOO1lpde3wbaVGxL2Q6v1ow5YyX4HCuu
Id5xQUnNMex1PhyfLShAwgepD7dgU4h3ZQ0zV3SFuRunbLY9AKU4228KOj2/t5Yt
carQJJHWoRya/zeoRAdgwEVwG4AIFXvgfNKdq9WnSYuDTiD9FjVLnqRg8Bhyp2p2
F0JjTNIN6+nybqsfGPy4BdOUamuFpHZSgBd4ck6UgN02Hc0LGkf6iAZgOlD9vlx8
o7gUKfbHqAj   $VybmQtc2Ftb2EtMjAxMTELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxh
bmQxCzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsT
BUJlcm5kMB4XDTExMDQyNTE3MTIzMVoXDTEyMDExNTE4MTIzMVowbjEZMBcGA1UE
AxMQYmVybmQtc2Ftb2EtMjAxMTELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxh
bmQxCzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsT
BUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAztMS5T+OH3ti
IEEBvs31dskDwnbXTB3SOjaDkL1VaxKL2TvZ7OCNZM2dw6AaMB8ZlTQqhTSNUl7e
/1Q9zpIYYNiQftqHUtn36li8d4a7uTM0KrMw8YCjgR4q3k59SWVSiqcCnlUvTYWv
4yFzJHiLEwDjoKiyXaPulZ8UpP0D6k8+mPFr7JSz2Yc4tHXMmmV2MQhTVM9Y41mX
c0SFFDGo0Blp9IqzcR2cRIsgScrrnKUKKHbLSCA2O7+JFMREu7eWTFKZmLtcdpqy
mUtT7aNQjEKpW81A8ymYcvzhKAYkRR+MLUDUU6SETvWkk+w42NUNLfB5R+S5+spQ
cTXkp9Or+uMUGl/co3uZk5IaSnwGwwcQ1VgttskclQ257u3gkT4HuUbWqRVqqPgN
kzK87ZYH8SmDD3wzJqUCuGvT3aAzw/beb74QKEANWHCtgmTA9PS/icTUnm2A28nx
bb1cq4yoxz0ItI1cCYjWa3qx83kT9K6C6Uqt0I4Q4BwjmO5ns7Y8timZhhcDqqhq
6MqmQyxaw6HRTpXTb3lE4cW2lstgn4XEaAB3X7QJjyU1n8jZhQjaV5yPdeDSX4az
EbDMZwhkK4N2O0lArH+QQmJllbBmHoXicWcLLFckG6vUmelyegj    BNElwgYPtruGU
NnZlWhN89lTnZ/SKjtFVx1WqT2siK9kCAwEAAaNYMFYwHQYDVR0OBBYEFHCGqyjC
4/z3V+Sz+LhB09U/cs1BMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEW
YmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEANdN6mh4i
yZ7MTMOH7+TeANoP6uMah+ZpKNX06izfcG1UrRb0nZxpuUMazycMDC893VhAKBeU
aq/3xpuFI2MnETQM6LiJeO7DOoSVSX9gBOs1VNAHXfm91wrz+bRNPd0YK4UHECMN
ZT3jKXWioC1tGReRn1yOK6bSgA2ib0L0d9pLnzJ/cxCYXnC1MKiRHy0Y2UatQoiL
pfm7Wes8rCrgm2t2Mw3vy0l908PNQtxG3MbnuChZ3ds0lcmpuOVZxg72Y+DZ0QDn
qgceQa6GkuqLgeMpIOTT1nnw1LenBm+Qirtx68AsK0A9f+bW+4PknDv24dzHq5Lv
csjlDW83r7nzn0d1v9mXB3IXyykYwnn7fZOwmg2VrUjKywr5gKgaYL5F+LMlN9ie
p+JImwY6+SMemGi1poI16oeAZQWAOWn9g1ZBQDSwWLDBq2GG6VUEA9xNmjCNbFUV
SIo3l5mk+tcf+y/XmEsOcioJ+ljb+KVcnOEtU7ZJuky5TjmwxlPC+9G3z1DWIwu1
+iXoSIhkeT2msBwNWPLwyPD3AaSK6m7DctLriSV3H3q0Jsh91obIYZSiydN+dci1
asdbUPSyehEGaptAkiOPM19jbNJz5wHCzihynFGoVH0o9FOvZsU5cQonjHOqbAoj
LnRm75DGAQ5WsZX5FPb4xkgJ22oddHuq2G0=
-----END CERTIFICATE-----
                                                                                                    &ZMBcGA1UE
AxMQYmVybmQtc2Ftb2EtMjAxMTELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxh
bmQxCzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsT
BUJlcm5kMB4XDTExMDQyNTE3MTIzMVoXDTEyMDExNTE4MTIzMVowbjEZMBcGA1UE
AxMQYmVybmQtc2Ftb2EtMjAxMTELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxh
bmQxCzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsT
BUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAztMS5T+OH3ti
IEEBvs31dskDwnbXTB3SOjaDkL1VaxKL2TvZ7OCNZM2dw6AaMB8ZlTQqhTSNUl7e
/1Q9zpIYYNiQftqHUtn36li8d4a7uTM0KrMw8YCjgR4q3k59SWVSiqcCnlUvTYWv
4yFzJHiLEwDjoKiyXaPulZ8UpP0D6k8+mPFr7JSz2Yc4tHXMmmV2MQhTVM9Y41mX
c0SFFDGo0Blp9IqzcR2cRIsgScrrnKUKKHbLSCA2O7+JFMREu7eWTFKZmLtcdpqy
mUtT7aNQjEKpW81A8ymYcvzhKAYkRR+MLUDUU6SETvWkk+w42NUNLfB5R+S5+spQ
cTXkp9Or+uMUGl/co3uZk5IaSnwGwwcQ1VgttskclQ257u3gkT4HuUbWqRVqqPgN
kzK87ZYH8SmDD3wzJqUCuGvT3aAzw/beb74QKEANWHCtgmTA9PS/icTUnm2A28nx
bb1cq4yoxz0ItI1cCYjWa3qx83kT9K6C6Uqt0I4Q4BwjmO5ns7Y8timZhhcDqqhq
6MqmQyxaw6HRTpXTb3lE4cW2lstgn4XEaAB3X7QJjyU1n8jZhQjaV5yPdeDSX4az
EbDMZwhkK4N2O0lArH+QQmJllbBmHoXicWc    LLFckG6vUmelyegjBNElwgYPtruGU
NnZlWhN89lTnZ/SKjtFVx1WqT2siK9kCAwEAAaNYMFYwHQYDVR0OBBYEFHCGqyjC
4/z3V+Sz+LhB09U/cs1BMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEW
YmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEANdN6mh4i
yZ7MTMOH7+TeANoP6uMah+ZpKNX06izfcG1UrRb0nZxpuUMazycMDC893VhAKBeU
aq/3xpuFI2MnETQM6LiJeO7DOoSVSX9gBOs1VNAHXfm91wrz+bRNPd0YK4UHECMN
ZT3jKXWioC1tGReRn1yOK6bSgA2ib0L0d9pLnzJ/cxCYXnC1MKiRHy0Y2UatQoiL
pfm7Wes8rCrgm2t2Mw3vy0l908PNQtxG3MbnuChZ3ds0lcmpuOVZxg72Y+DZ0QDn
qgceQa6GkuqLgeMpIOTT1nnw1LenBm+Qirtx68AsK0A9f+bW+4PknDv24dzHq5Lv
csjlDW83r7nzn0d1v9mXB3IXyykYwnn7fZOwmg2VrUjKywr5gKgaYL5F+LMlN9ie
p+JImwY6+SMemGi1poI16oeAZQWAOWn9g1ZBQDSwWLDBq2GG6VUEA9xNmjCNbFUV
SIo3l5mk+tcf+y/XmEsOcioJ+ljb+KVcnOEtU7ZJuky5TjmwxlPC+9G3z1DWIwu1
+iXoSIhkeT2msBwNWPLwyPD3AaSK6m7DctLriSV3H3q0Jsh91obIYZSiydN+dci1
asdbUPSyehEGaptAkiOPM19jbNJz5wHCzihynFGoVH0o9FOvZsU5cQonjHOqbAoj
LnRm75DGAQ5WsZX5FPb4xkgJ22oddHuq2G0=
-----END CERTIFICATE-----
                                                                                     (VybmRocy0yMDExMQswCQYDVQQGEwJDQTETMBEGA1UEBxMKUmlkZ2V2aWxs
ZTELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMF
QmVybmQwHhcNMTEwMjE5MjExMDMxWhcNMTIwMjE5MjExMDMxWjBtMRUwEwYDVQQD
EwxiZXJuZGhzLTIwMTExCzAJBgNVBAYTAkNBMRMwEQYDVQQHEwpSaWRnZXZpbGxl
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMYjhslazP4D/eGs
B0oXOudt586pw2kTtjXYTvIdVaLOyoYrIodalpi7B3353YmWH7/WPb+rIXxNMJTo
RCrNRb7d0fnMhg6uBSuB2imekkgF+szRY6u0ykgZNJaySZAcGnO/vkdsD8+VIBsv
tvoqGyWXbCoQLXxcDJnSpkDFDEwOJcDUmNK5Kkr0PaB82tZdShpHHqr4V8t7UoJF
rWViFLZXyIaWmocBme/NxCNiwwNfvDpg21RKCh1vA/yU687QTTJAXUYRgs9Xlcp+
10FQlamcB+uWepJJu3uH9qjXsnCiJlfn1e4bAXjVFew/h25PvXhmNsMiN/lz2X7T
QgtthtT05nalztuCS2fWRz3OHW6UMFlX3FLnKZ5H61dWRJImtgx5ByHVsSl2Pv4f
HrikiDcYVvZOuw27qpQo8rXnaTBlPbITohVW6auHo6DCtl3rFNGONpCsp5y6THzE
+ha7bs+iU6XGS47YBH0YN6jZ7SSPKGhi9dM6HB1rM9GvKIwouvO3Ok8Mbs2yxNvu
yY1PXgoo5i+q11M+/6OvuHIkoL2O+Rz+mo8kiLhtF0O9eZd0QZ6ygzj6/gLvoESx
rIy3m+3goLT+XLMbldPnRYUQuhSPCIUNRYG1RWi8iE2QEZtQQxT    qvPl97Jw9DW0M
WogO17l9WzvUwvjiMCCjCko+CHhLAgMBAAGjWDBWMB0GA1UdDgQWBBQlh5X0zldX
8QbnRNNIMcK5i/Y78jASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQaMBiBFmJl
cm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAGK7nQDWQArq
0Yox/f78H3XljAxdxgay5mz5+TiH+rh586K3RPZ5fo7K18cudiymj7fXu/Dceoy1
ABxNWd3+H3ZeLbA2m9/EKHS8wCZAmUPwIgVj2hsYwtSvpxHBNpGciL/dCNTSOLk2
9bq3JZB5co68OmX1p3WpBNaMJ9JQhVpzrUPA5lXujrNnX0FDBG9YL3kO3OFsvv7h
YQdAwOm1lpypDqtcZrZSpp3Rx6GXNE+173PPCS/uKSsdeSJwfpDJNDicaB1baB+C
VRTeuAcxCGGRlFwD/a4RlMaUb1WYRb7w7qxpmi/ZVd5su3Rnttiz3xTMRWqRx4KD
bU5onMe+XdVMbJV9Re1bAc92VjxVf5QxHg79Wh2e46KFqi3bGz0nq03MLwCuMjKR
Df+WZ+EZbAT/pOpOeC/AbyQV6j8gBd0PYRsQNySczfr0yi7FXbN5orEWjP7lD5Jq
sIslM7SSDBMy28EMJYFAwIVE8JaPnh7L9gC+4jOpRZSTCDD3zLoBNH1IFkid1gN6
+9B1ZV1pdzXb/UMtjv989mtyXHM26dM6gznwFHvuZCnAhtrdiySsfHaZaQm7WeCp
lT7rzlUIvIre/92x3gTtj25MswUA6PAg1OZckRgsUEFijFZTXjBa0BAkJgG5D5JC
cg1U/Ygjdtf1CWrWk7ukf6XkqHNXxwvN
-----END CERTIFICATE-----
                                                                                                        +--END PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIFpDCCA4ygAwIBAgIIAsxESFJwr4QwDQYJKoZIhvcNAQEFBQAwZTEVMBMGA1UE
AwwMQmVybmQgU3RyYW1tMRMwEQYDVQQHDApSSWRnZXZpbGxlMRAwDgYDVQQIDAdP
bnRhcmlvMRUwEwYDVQQKDAxCZXJuZCBTdHJhbW0xDjAMBgNVBAsMBUJlcm5kMB4X
DTE2MTExNjEyMzYyOFoXDTI2MTExNDEyMzYyOFowZTEVMBMGA1UEAwwMQmVybmQg
U3RyYW1tMRMwEQYDVQQHDApSSWRnZXZpbGxlMRAwDgYDVQQIDAdPbnRhcmlvMRUw
EwYDVQQKDAxCZXJuZCBTdHJhbW0xDjAMBgNVBAsMBUJlcm5kMIICIjANBgkqhkiG
9w0BAQEFAAOCAg8AMIICCgKCAgEAo+uHwt63JNZOM1nZZXsUsqCqa8IjggXGdkFi
Ra/cJEH6D1R8A8AViJNOpG08j+d1jnM/jxmbeGaEY0h8oxGao9rIcUWpgmMUTLWj
QkK+ROt/Oz7jZKz608Th4PMNXqfqA75fCYsceli0Uf/EXJYtBkNln540T/Et18C5
O7yTIHC2A51/v97q8Bq9VnB1p3D9r/zieHCrKyMzXhuGV6oaGGcj8dY8bTXIM5Pe
clTpv4G1HUJotUIsWJDmEDJR2dGoRZux4odkgWPe3QFizHGTeliB+MWWIJcNrZ57
0FSlhAYyWUY4lsNIGAS0GyFBuiiIhpj+3u0SgPE/PlPnqrf6gUBfaWbFopXmBfvE
ccB5ORT6+UZVVTL3OE4mxx298dY7F/yie6XWW+kKfhAapNzemNafy3vH3B+A+sXG
ZK8657RyfZW82CwbuE8SsCxtQvJW7kPEICjqGo3eM9Lnrvfx/i/5Hh+rMYUU6t1D
vxapxr34ENPPIQTMWqDy8wD+gKiwSPrg+7/wR20ogKOCtdyh7KXBgdL0FG/          Z   V   W      X   Y   V   W   X   Y   Z   '   %   $   #   	      	      	            	      :      W   X   Y   Z   V   M   N   N   _   `   a   R   S   U   T   H   G   F   E   '      '   (      0b2JhZ28tcWNhMQswCQYDVQQGEwJDQTETMBEGA1UE
BxMKUmlkZ2V2aWxsZTEQMA4GA1UECBMHT250YXJpbzEVMBMGA1UEChMMQmVybmQg
U3RyYW1tMQ4wDAYDVQQLEwVCZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
AgoCggIBAJkX5isAWvdNLjQzbifSTk7p23VqCffwpLwDywGJqZGFRBiydN4CqWlv
WM0XgmNnXg48tIkopwGICk1l7d5XVnkOxdwFhlhDKYQq+Ebmk0ZF/tQOWBxTB6ea
gXsh3Wxl8uNYmPn0kKc7HX32Hj/T6Fvpg/zsXSykYCdbzMHRs4Hg3++A/Gt/yBD9
HogldIMED3I8Y/sUfYVHo4erchid/+ecCAbjRfbTpnww2Oc/OqwYtmFPtYhuwlBj
6uds032KckSTvgBK24Lg1mdduvJ12PzcqwtC47UbnEMDjNk3WOHtU2w7PIjSR83r
iR5YWAakrH2PBQxTrhfQGDf3s+YQ8yZL/4j/OmrVL048hS1u75LQCGGzqvN0vDT1
udU6f6en7kffYlvR9vWldmBBX0bCTnBmUhvFROyZl526p3T+nkRm23ObjE3lhLZD
Tl7GXDnxwbNdsk1URiNC80X5sKvAn1+wIRMnT7nJALBpEjQt7v6Po0aAYMSbinuq
ryinq0815is3BSsjzpHf5uzOfa1hxgvFqVl8EGTKi5WQ8t9CvB9KpOdWiHtH65Ls
ZdEnEmyTquEIFa1rx3tw18/X+8XZIJRWC4zhFkc/tCu5X6/ePod    jGh1e
aqP45SNQ/KU6OmdhDD0/9bG86V8+TnTQWxaSZ8ziR2/Ghf8Npic8y2MnWygaScNb
u0CpAJoP3IKHYHn1lmYOH8oXv4fSKVvUqLMkwOP4uo5DBK6ZEVvCCyVe0sQGb5/p
/HQyXQMCAwEAAaNYMFYwHQYDVR0OBBYEFLmrHtdPUPY7IqWCqHnYMgXocn/0MBIG
A1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEWYmVybmQuc3RyYW1tQGdtYWls
LmNvbTANBgkqhkiG9w0BAQUFAAOCAgEAEfRaVw1shuDvMoN3/owLnXtc/01qP/48
+aJy45YWlHbE/s2ejbWV51zb1QaoSCG0GfOToMTVvWZ+4eN6F93O6Nbk9iFZ1Vqh
FjFTZIJESHELIcCuE2U82rZpKlIoJfz/IlG/wCZGE7avoMitFU74c0cQkYquML/h
FEUNTA5p5hWHiUSAj1P71Mc7du1OK7B4BVp9JOo1YtnerXBUPw4ceYAdBBxKKgER
pzPR7v60agmem8Sdq7w8S0Q0AzE4QXNVDzt9614PPCqUlV4/sCT2Jx0iTKTJTiRn
zw04/su8NOJBasTSUEtarqISGda+Nn/ki7vtcxa62J7hG10dYUqJ+s8Vti590K4W
NOD6S2ccI6kmVV5FbC54WEskzyEmYcdBnzIRIThuexxVu7sEzS3Om1pNvRlgY6Eq
v1NIav+vJWIdQqJsP85HohOdzv9F6sJiNEtrPjW/B0Y0/E40Rqavz5jwghCHza3B
yfUSmRcWFdKYr3BXbERdc9hwU58evDcn9tzi2f2BocnACfMXg7k61jLKlLKPR3cE
w7d+pjiQF5vBa4AB6zySu/qn5MHABMZHUulX7YJTZPgnNC1J9hlYTMX0Jhd60QKM
RLgeHjJKiQKkpCqZQE1b6EzqRh7sg71EqZCtTHQctGP2zk4dA2htN67sjLeBuAC/
iTyZPn5VJ4U=
-----END CERTIFICATE-----
    47xm7iGvlLkQp
/TXsu9N8aq+sa+VdpLbaW4od4BTPAgMBAAGjWDBWMB0GA1UdDgQWBBTfc9Gi87Cx
Mk/5qdw4ZUuTa5/c2jASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQaMBiBFmJl
cm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAAz+MpddY4xv
AtGkbIrU/n/rXFLIHQCPdYVLWwxm5tghu0wMpavtvHaSz5uBZudLQqW1dpIKxoGU
7NyF31YIxx/ZEB9jbL0479xmf+0ihaESbOiYDZAepJik4s1AeFVCsK/QbCwbbfTu
Huyt9J0ggHimbI3/+QOSGXEF4QqDFPAc7qB+n1P/N1DMT7Cftp/i70Tj6nB27w8i
xVITRliBPaevekcJ9smdRwOnKXIWE3UT5p7KNZMSA80ESTJAEaeKM1DvX2NgO9px
Z4ksFZOwR7CvQ30kY6IaF1Vw1czHUgu0wIviY7orMZ/Ka7gHwmMu24Qf7h7sEajh
zB1CGMK2yWbYYuRd+1jIRENmYpyd0ET6GH9IXgkzDwSUkj1/uesifJFLsuk45B5V
8bCEpwla8K/h/VPC6ValW7JeEY0wq5xZYvHMoUe4TzDUZqAqqXl+GIA8ewGV364W
j3NOXEVYlTjxF/QxwTF2+SR/D7EODWRomT1aKOwktrALitb+Ip/uOPON9unapLOj
ZUvqBpuzFf9lDnU16vlvA/VFFeWEJQQGFrhMLqJM/KG32BE1TZkSaGrsVsjugx9u
YdeAEHz/9MXCPZ5nD/9I/8DUrrZftkZaiV3+8CAV7W2gHL0ZvzosoInuAyHubtDC
PnKy4r0lPnAjCC62jdqbS9eHqz4yfK2I
-----END CERTIFICATE-----
                                                                                                           ��                                                                                                                                                                                                                                                                                                                                                                                                                                               G=�'bernd-on-tobago.berndnet-----BEGIN CERTIFICATE-----
MIIHQDCCBSigAwIBAgIBBDANBgkqhkiG9w0BAQUFADCBmDELMAkGA1UEBhMCQ0Ex
EDAOBgNVBAgTB09udGFyaW8xEzARBgNVBAcTClJpZGdldmlsbGUxFTATBgNVBAoT
DEJlcm5kIFN0cmFtbTEOMAwGA1UECxMFQmVybmQxFDASBgNVBAMTC0Jlcm5kU3Ry
YW1tMSUwIwYJKoZIhvcNAQkBFhZiZXJuZC5zdHJhbW1AZ21haWwuY29tMB4XDTEw
MDcxMzE0MDkwM1oXDTEwMDgxMDE0MDkwM1owgaUxCzAJBgNVBAYTAkNBMRAwDgYD
VQQIEwdPbnRhcmlvMRMwEQYDVQQHEwpSaWRnZXZpbGxlMRUwEwYDVQQKEwxCZXJu
ZCBTdHJhbW0xDjAMBgNVBAsT   n1�bernd-barbados-sep-----BEGIN CERTIFICATE-----
MIIFujCCA6KgAwIBAgIIAsogpko6tmIwDQYJKoZIhvcNAQEFBQAwc   T
      ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ,bernd-on-tobago.b   bernd-barbados-sep
      ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     r'   m-----BEGIN CERTIFICATE-----
MIIFujCCA6KgAwIBAgIIAsogpko6tmIwDQYJKoZIhvcNAQEFBQAwcDEbMBkGA1UE
AxMSYm   ,   ,VybmQtbWF1aS0yMDExMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFu
ZDELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMF
QmVybmQwHhcNMTAxMjEyMTkwNTExWhcNMTExMjIyMTkwNTExWjBtMRgwFgYDVQQD
Ew9iZXJuZC1tYXVpLTIwMTExCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAKnjim0+d6nGiyUU
uO2hV39OGhGe2HvvUCXTWv6oBoinaDBlvisop3uSiHCknoDFyVkXen5H46/YZ5lr
wtvcskIkVz10w7HZQkar5s24GWeDPKSaC2wE7sZjtI5Gem/tRGR0T9z01am+8T6I
fODFJlRjFkQiZBE7dtIfBMgfW3q5VpZYSvFQd3jwwzy86Oi7jhsOTVUq1SmYBr0s
CzoKSY2DZWOR6LLqZYfcXAEOUC4MFN08cf6BOL7v25rR4oeYJpVM5ihpW/RJfsJA
I0B9u/mIXbRFQcdpNtqSb67NYxdNZWYQ9CTvNpp72yoltTPeicmPnyB9z+gRZsjf
toaq+21REwg18YozlBZB1nqaWQmRwCF3Ta+B1AoAZJq6AehKqgBfKqX9O2L4p3U6
WP7hu8zRi+Qesp1JvAER0mnxSy+G/xC/M94M4qOiYlOBiPjXwu8zUeOcKBU7BYFv
fw/rvbDKcjMgpoFNCTlurhQ/PyVC5TXpzjkMx35vCIp+5L0EIPQlz8uOeBqV9qWH
TUoxSmz4z6Kzo1DrfZMTm7dguN6t9WaSt1S0UPSM55Xw/QKBzZmJK5i9F6sI2IxM
IzzV143kLX8jY6K6n2T7sm0CLP/HPlnPDC/h4eO84i78IOR2dnN   2VybmQtYXJjaDY0MQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFuZDEQ
MA4GA1UECBMHT250YXJpbzEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQL
EwVCZXJuZDAeFw0xMDA5MTYwMjIyNDdaFw0xMDEwMTYwMjIyNDdaMG8xFTATBgNV
BAMTDGJlcm5kLWFyY2g2NDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQx
EDAOBgNVBAgTB09udGFyaW8xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UE
CxMFQmVybmQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDlHLa6igFX
NzDi4Z1boQh8RVLZMU+K3ldfeGOmhapB+0ApkHVehx4e3FAEZmEg5Iik4HZQ1BEK
SYU3F9x1ugfdUklyq1U+VF8IfeoxKAzrq6CZcb9C06rXf1KZCngRqA31VcvkoOka
u5HKvQmaLYynx/77T/eidOYl4w17LMTdOK4qX6L8/CxThznt58D5/GZmVrbH4Jvq
t2U2+MgPaTkPRQ0bdhWg7qmrDEPdVpHBZUZn1gzCmLOLiN/IqP6HDGVgWr3hcs7d
C+/XWVEbTVc/UiUVsvkfAK3cRPmn/c+PiQ6p7FrRmJ0PI7zVXOfjOmrRqG9V1S0Y
CkrFXh/EskV/RiXdZMl0hNnm4RrhnE7q0bUsKdJ7DWS+m52/jH0xzEtfV4Llo3bv
tam/ebS0dym+/48eWjPrazOWVXl+qJdB9rso5G+j+Xb8m99NJoDVEcvs80zZgp+N
GR0HOAk/TXOoMXNFpZyKqvN5T1b0EsGBTxjN8KPFElMNUZEgLUUrugRqAF7inHTR
vmnwD87J/py8JqqOS+/uxu/ZA+SAZJ90NaYotZQBe1Q4+igkDGUtr/tVoco7WOeQ
TWV9VFXkF3lAYf4T84oqk+nvR7T2VHrKchY8wK+qWxhFvucBlEI    XQ1u0CrvxURLn
dw46dz4LjjmIcgJGw/BTEKOgjj5kul0OuwIDAQABo1gwVjAdBgNVHQ4EFgQUGBhY
8yqR+lhb3i2Du7JUkzSBJA0wEgYDVR0TAQH/BAgwBgEBAQIBCDAhBgNVHREEGjAY
gRZiZXJuZC5zdHJhbW1AZ21haWwuY29tMA0GCSqGSIb3DQEBBQUAA4ICAQCr3X0v
04nBw4SMpY9AEbNAcXxKF5LTB88UDLyudzXXSvDRz7XaS3EpdOu1k24PkDs0SYoQ
EEcqc2Q2Lk8PnXVIMH4RPPe7LYumy4S82R3l0AWgJDtUxbpJuBI06WJOB5s0IOkS
wR9IDeNHPt+xnIcUvXyTyI/bXuUARXwMVGtQVwuMN1KtxDZsrbuKWe6dgBFx32Aj
k/RxZc+x6IdsHSepJwHHj2l/wYmf18jwvw7bdUCkH4kdgalhYfIEouIer4qxbFsK
DGIFtOts7ppCc63nCaq5nNf3dMKrdIwRTk7lDUEXL+ghkW0FNsKWchAPrGJqfM32
Q6NQ5L5K7OC5P82bj+JLVwwO3VmdEbxgfvRiwR5RQn5YCiAocUWI6CMPB2KeBgJt
dWZNAOOBQSaYX4JW3eHHrVsq1iUslnXWTetrEF43AnB8g8tfI95Oqo3RG1M6deLC
NGBC21S8HeuoVHotd4f+FpCPZFvGVnSQ1Z4az00rfvvWTYxWuJA/jkFjffkBQuDH
78MXVQznMhKh3UaXbmf4v4U/L7C1WdOcY2g4h6H1ZBb8zGGU6oMS5FGuLwUk4WIY
47McTCCtQ28zwXPNHtk76jn2bUMtz945TaCwC+RsXqqruXjsJPVsjwZWu3BMKEXt
sTl521zB2M/MRfOsJ35L2dzGCyxpeshGSpAEVA==
-----END CERTIFICATE-----
���������������������������������������������������������������������������������������������   7H9OSW1p+qkJLqD/2ABRDX2dC2IA65q22zDroCTRFp
8Oxs5dRtdLnAgrlaKOnHWjwPmqfVTb0pVc7VBX3Ro1dFyx1HGZEKk6YYq1gYmSwL
b9dLdLqJHfNWUDfYRp0BHTUeHMSFIG0HDB2nWpsN8ysTzk1V+z+nU3ZB39CPaoe7
PQQCJz2znr11Ui+xGgvTlXurYRRIET9EaIIjDPjfYYewk2TsIHi6/aE5R7QaNWvC
/qntIf7u2Vmrr0qP6uIbAQKCAQEA/vxaXxSOl1RQvUWK6jk93c+G3s1dNr+3rrbX
MGs109djdiqfMSJWD6C2+YL9QUzequGRy+Vh2YpFRNlbaYPEdbDdmG6Cd3vz5HH9
UVtSCqJzIolcFqfpVDN6u4Q+Xvh5zJAiyEUe915qxbFer3y/jQEhQIagobbDQENm
yowVa8ICp5ahnezcQ6RZxywg2SrjiGlRofKYG6CpXSs4zuDw3LS7v89GBlDuMr+T
FPpcYxGb6yfIdyeUkik3E3JYYN7AuOjryc+BhMk8McsQf4swbjcOJKEFv54244co
GbszVhZWM6Pon8OeDeF0u404g5+OzboX9ehPfDr0Z97UADeJ5QKCAQEA3LhmODoV
Lz/+PV2JZ0VVXsXPOS6B+EdAWRR5U/t6lgWXk08i3DTUpKvP+pp+hcSb3ibeFT4w
9+Z+bQVWppgrnB1Q/MLjErnk/z4Szph4b9/iYgwjoGnhw0ukOp5YNzdwhTxazxet
xgkwQuhtVqSG4KhtxwG1/w+liCHiO7fPb9HaWCv29Nei7aWgcSqbzFzswl4oDLN2
fNEvy62h8+NGM6YV7weVkehD2tiFmJTi6HFaZoJOJ9LRp/H+BdwGbjxYnzXzl2uc
Nfa6S+FIeUeWMvIIMzbgkTCETD5rHDpO/Ai4OcefKPzOG/JNrdKkRqLyv/afIJ+I
uoTjPkUwuxvloQKCAQAR/J0nXdzdIe58G368HQOXNP9vkg8EQKvlYDJ30OhAJE54
1HL   3bKteVUpQy8OmzgRrYfSPf
ApA7845gcsj4llWXZwzVGgkY+klv1HMAackinPEy7k0IDVMocGT8a3OkLKoEs6lV
Tw1vxJfJPDagh0ZCK9UXOGEQmD4uu7egmjTqjB0fI0+UK1/6uSTw+ZWhloHeCtlA
NSNtz6iXl3ODiqzYOa+bxWJIIQjJxPtdvKaO5VZP3WiOwXPBQSTCzt5AUxoNOfcE
at04Zb0LgpNUGLShl4OiASKj+YlkHBBGjncgNNl2Xgz0DZ8qkzQkHThzPwSMsHcu
NJMw9Om0UBZ1cXSZL3mvp+dYmL03IDm8pLhEfljwN+OrV3n1EzcJdOXHupGIow85
3EjHxBhcnSJNRVBj6ZqZVkfYW5Sm9wB0APliRyZCyaCMSQ9/vT75lpZ8FFbn/p+a
G6fpoCRoZzbBAwQ2ly7V/6gbu6Qnz5lIr27Dhh1giHse+Pobu9TIOg3RXrISN3AU
zX+RFGe0HgxGl6PpJJh6kDzsckZwBM/ZVtD4h5m04DCe6o0Yzy8feXanqvg3iy9e
PndHwOwDxlgWghhrOQpzNfMLo26SBQIDAQABAoICAQDRUONMxKt3wQDxMRD3qFbv
tekoQqm9clGWe62xfPMYwSIZymbyc6ynMq3SA+/WywLJLqd/cTKVSPBo3B3bKPvP
RSRz4pORiGzPBdUY71HlknDK8o4rGvrHRHkHyEymcY+EyPfZ3uxufwduR4SIcCZ5
EhDjDk/D7Wu8YiOTUoolHYO5Ov80I3VK5rUVG4q3j/u2kZ/zCkt+Woi5HqFOb0GN
afUg9msgiZdDmnxgTnO2DyiQkwIa5vi7MuWLz5h8oVbY0Ol0hlZz0KR0i6OF5BdC
7gIfliNnY9UdXNtsjXdOlGw4HWv/1b9OHyJz+SB7OckEae4WFIlTWoMkA5NJJSTN
UcHNc4BmH04eIKvHXVme8Yid9lD34dE+VGX+jKHnPgEsrQ38q63HA06hG7B2poWe
zTU+et+KTnH0J7aoyKG1g7d   c ��c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     6;+$berndstramm.y@gmail.comtalk.google.comDAwRB1JKQQ==,1!$berndhs@jabber.orgjabber.orgBwsZBhEBCSUE59+$bernd.stramm@gmail.comtalk.google.comDAwRB1IXRg==
   � ���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ;berndstramm.y@gmail.com1berndhs@jabber.org9bernd.stramm@gmail.com   8cVW66tXySx0G0LIb8iOLu/iRT4yQVwjtniwr9vlczXIBJi23d7IiRB58W7vSu
OABN/NRBw0viFGcN7fsxie1aMT4I9xkTDvr96A/fE3hUA+sq3SiSzO5gVVdhfZMQ
XVjTOhUjlGFc4mkCyLq6Mau3f9RpBoFL+DOOrGFxQDKKSkXHRkg3PjpS3YJM3r4f
7XN/rEQXt16SOZuwYaY4pP2VA9VAF63uWUO1q4zkCXAu90jfhnqavDsA7aqmZPb5
t5M+Sd9JXWENpd2Zs1SwgHMWPqf0vHfnJ9nOlhxdAoIBAQCGsB/wf8EdrDdAyytl
0XFe++aQRkkZcKFbupqvHO6ZTaBJTClBpxt7wTyQ+GXsyyUyUxWCcQkAva64aGGQ
F5vFED6zf1mBu955wy9G0tPrsPs8SZwT74jM3APDoYzDZRlMtJ/Vb+Wiy0igC6Vt
EckcnqsenXSpyKqCf+rF9kynN6+9zlZM4qmRy1g0toOMGciAc2SNG5ZaZGx+Jd6G
LVJRgjAwRLiI6Os/SJF9op00qrc3hpyawJMfoRQaD0H9UuXhgdK7u/b/Fyhn1Xmc
SIrnW7qVRg+Tib+xpwVFnG9GbSu+VopRQLOlah7sy3VjhVwMuDoydifBagYhoacz
BrsBAoIBAEysxTnTFxQYIIBRtATxe2ZovqlTrz43zTA08igNwhkEUBrSjE5xvbRD
qSMpQthqggDXw50M7aWaDyexLBM2AJFiQyzrPSuYsWZi1P9uA50iNJoz8+8XbmVk
2IDN9VUd3EgLjlB+i/LKfEhExmuHyIBr6LZLIkZEHRQm/y9Af7gbWIwMzCHbLxUF
naNx0vpgbN2UGGSgSbr5Y4t4oeGA/OL9PbqtVTLfmQZ/vXcgIW2XEM63tdvVN9Ob
Hr9Xyq0XECQbC7TXuOlBpwGBdF3cNEH+cQUKpOviJnxe6qxV+yYPcfkI4wO6Gs/j
eowO2X/vz5xDPFc+KTubIzhKoG/fleQ=
-----END PRIVAT   9E KEY-----
-----BEGIN CERTIFICATE-----
MIIFrDCCA5SgAwIBAgIIAsohjwyB8CEwDQYJKoZIhvcNAQEFBQAwazEPMA0GA1UE
AxMGbm9ib2R5MQswCQYDVQQGEwJBUTERMA8GA1UEBxMITm8gUGxhY2UxDTALBgNV
BAgTBE5vbmUxGjAYBgNVBAoTEUNvbXBsZXRlIERpc29yZGVyMQ0wCwYDVQQLEwRa
ZXJvMB4XDTEwMTAwMzIwNDUyOVoXDTM1MDkyNzIwNDUyOVowazEPMA0GA1UEAxMG
bm9ib2R5MQswCQYDVQQGEwJBUTERMA8GA1UEBxMITm8gUGxhY2UxDTALBgNVBAgT
BE5vbmUxGjAYBgNVBAoTEUNvbXBsZXRlIERpc29yZGVyMQ0wCwYDVQQLEwRaZXJv
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA29iI2zcRPcOP25OImR4y
wj3Srqz2IR4AzrLxoxwB5OxTtP0GQ6O8IwSTF7qfcSOxFNKvNcoIgs7yaTpkevHf
0cqIVB4gwaF7xqvre0FAr89ich4vGxMFBdCGWyrXlVKUMvDps4Ea2H0j3wKQO/OO
YHLI+JZVl2cM1RoJGPpJb9RzAGnJIpzxMu5NCA1TKHBk/GtzpCyqBLOpVU8Nb8SX
yTw2oIdGQivVFzhhEJg+Lru3oJo06owdHyNPlCtf+rkk8PmVoZaB3grZQDUjbc+o
l5dzg4qs2Dmvm8ViSCEIycT7XbymjuVWT91ojsFzwUEkws7eQFMaDTn3BGrdOGW9
C4KTVBi0oZeDogEio/mJZBwQRo53IDTZdl4M9A2fKpM0JB04cz8EjLB3LjSTMPTp
tFAWdXF0mS95r6fnWJi9NyA5vKS4RH5Y8Dfjq1d59RM3CXTlx7qRiKMPOdxIx8QY
XJ0iTUVQY+mamVZH2FuUpvcAdAD5YkcmQsmgjEkPf70++ZaWfBRW5/6fmhun6aAk
aGc2wQ    MENpcu1f+oG7ukJ8+ZSK9uw4YdYIh7Hvj6G7vUyDoN0V6yEjdwFM1/kRRn
tB4MRpej6SSYepA87HJGcATP2VbQ+IeZtOAwnuqNGM8vH3l2p6r4N4svXj53R8Ds
A8ZYFoIYazkKczXzC6NukgUCAwEAAaNUMFIwHQYDVR0OBBYEFAyRnP8fUlIAa55D
knmEnlthEGCLMBIGA1UdEwEB/wQIMAYBAQECAQgwHQYDVR0RBBYwFIESbm9ib2R5
QGV4YW1wbGUuY29tMA0GCSqGSIb3DQEBBQUAA4ICAQDZbJPetBaijvpZK5wHLJBY
wgtR53mj4POuhU6YahhBrwX9FwonEtRtLOa3HGlg3sx9MqrmoiurZObbsqKqODon
dR6BpinNAuetK0ILveJxRmXWz+bBD9DQnn9j4ts8VSy8hp8nwXA2/PqkDYmHMUJf
bQBORf23WlzYs877iQw5O3BW50DZ5YC/c4mGieQgvPHwt62HbWeMuYKuxguOcYoF
LRMcYbicAItBsdKPoSU8xhvR4kvGkjvivvTAQ/17nk5uud4Pwl2j606exRF4+ZzS
PCimkfmG3TmFPR39q+jCOhBSKW8c/BPYSHsZM/YCd81MtP5r1QgCzUSMpMk+UW4U
V0pa+bMTjCH9KxJ0pmyyejcZ0W/hUKj1TgFcLwQm3Zi3zt1jEQiQbdJ7eL9XjDov
T973xVo7syId7ciYLqpFWW0tHu11ezDO1yZ0veStqZ9VVFM7B/ZJzEQlYDs/+6IT
+CNw78Ef6GAS4sYuR63FNlodT5w2JJrEgtp2jlSnCjV6Hp9a17e6+nbqqx2VS9p2
jQYfA5HXBv6/BznH0IJ76rPTx1WLcAwwDmCtEhmU/HcEJZxU0UPTAw4xje0VBpL9
rv7wSoGQppsicfPyCse8EXdp9Pf1Yfw+qt6z/3Cp69iiS81C9E3xOKDdJhDt+S5t
h9/yELWSRH+JiRi9J85maw==
-----END CERTIFICATE-----
   FTTYVkB4yXFOHcZEop
Nm+jf08TwApiSlQ0fjkp3W3jamiGkZFM22JHftqyLHmOV6eAv9GRSfYF59FxDJxO
Aca05yqbUhUbDQzJ0AcHQRMWNMbzZsmj//6dFKNXLF3KVYG2soYVyztHuR3XiSWo
/0cM9GvW7k2IiIWjA61ieAdNL1lWeu89e64dFsT0hz7b9rGY+Vpaa8KPUdM12A9p
SshaAQjF6aD8v4qUS9a5O7pEW5+voEyx+mK77913B05SG5pCytWB97IkPlkJzBGJ
ZlLUzzQuu2OYJajP4AyxQX3UGCYRRs4vvuj1FhYpObv26opMqnVPmr8goyNRoAMm
Kg+k3o9b6nQtA7vUTt3G/UK+voVxksDVtuMA9qnfFf9RSM0AsI88LqiiuNWrgv8f
OBrHz2HdWm7tvzKaZMyeD8t5Gql5SXby40WcUUDXLKi7RuSM6vI7U9R7iC0997PT
l4IzkAaMDG3MI4tsllk4nH+66R4TQ8UJFMJbswuxTsz4ZrLUWSftek0kKHzBxWIy
P6CiF6b3v9IcAnINRodWz9T9sHt35wIDAQABAoICADg2+KUhBjQW+FLV0T1JuRYJ
gFO8F+Cz9YBGLEdtAbhuGIzU6xRMKinvfrljBKz4fT1vKjDoXXYbdoSYHWkiy715
Y72gn6eHLT+gmeegBAYyoUTZzTpUFVTaYi0gB+mbn+3a6BQZ/W2gSdqTiiK+RZS+
epF3+BMu8i6tdV2uoLqmrSHsRLRu7ZHD2eknYmduqh/dnuco8TQUkvfSQEZTMdZy
Q3UhyRau+ZOjFjzjPZTESEzMDstGLdFkbRhhVQqK5U4CDC5fojRQ5sFK3yor3q2Y
w1azZC2pxPUYDpctknwVbv5Dvhon/9dZFymJO+CwEHw/8TWQ3OexGwJjImigi3RH
sxtDERRdEIHwGCguezLEL6Bgc8+zUOYYR6/VbBs1Lf4x9uIDkW9Et5vdSbF4JNR2
66a1XayQXXDKN/lt6K8QprV4xXA   >VybmQtYmFyYmFkb3Mtbm92MQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2Vs
bGFuZDELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UE
CxMFQmVybmQwHhcNMTAxMDEyMDA0NDI5WhcNMTEwMTEwMDE0NDI5WjBwMRswGQYD
VQQDExJiZXJuZC1iYXJiYWRvcy1ub3YxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdX
ZWxsYW5kMQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYD
VQQLEwVCZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOL96sGp
/HgpcNy9wvDxTTHr1Slq7V7CW9OH0h5da9Bbp6fcPmOe9TW3WiQnd3fAjkjipPw2
j1NojnpqW3ks3cF+NEED5DKfCeA5vdeAZiUKdVq+yxkzqhYc1hvQs6ucqCMZw0Cl
4l6H7+7B+n8qUoxvIAhmlRm5KdRXDmeyEQThxyNDu0fxwjwq/JK4vyIXNWQV2/tz
CylEURqVuvoCDKWbym0u+aA4h5p7Y+kSniTdk5BryKdsd+J1fZnA9V8VOgRoyg2n
V++wQ6EVHcY4pYCq0ebDQXqZcnbvWpE/ixPEoQWu8S8h1aGHoQVn4YpINcSA6CZT
GeOXZtZm+gvNHzZxD2b0/hxuGCfKMZFh54tW+CQwu7M1eZN2soQNMtVz1MJoreNJ
jev5UHJj3GUc9GEFkZJE1wXf16kJxuOAGd2HxrX/G3ecVd6S4u1dOwL2RgTOFahK
0Fqfk2uTrJtuz7ZVRR2+L2DOEsOrcxqYJzhgCzEVRhoESh/A9HzN6yNRb/7TGfY8
Fpw2s7x+EXg3SF6G6rqTypgUNSw9u/UAyAWTSk87QL8MNLNugKMs6c6FihJxhSCG
1xLlcCvBhBKLO2Hyx+1CmDrSxoZWYrsWyKXb8/fXiHcNzgrfqmQ    O4/06xI2n6+YfEjKnqXYXrk0lFi
34AK1O8U/YpsmHDow/6bN6BKbuIb5BLudaxJr/MCAwEAAaNYMFYwHQYDVR0OBBYE
FJ6rLAI2MxO5H8ZDSG7zoa2ZeMSZMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0R
BBowGIEWYmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEA
UqEBXnTvl8RSqfFDpBtIk2RE5NUzAsuGvSAQydxOmq5ZKOOBjDOfKMjYneZ1u/S6
uJsqtFNYNW2JjFRkFmRc+NztvfOteU5bZPXA1vUjFcLxQdoNBFUOfG01+oDDKZ5T
aVpqIjqx0Lg8VanqInbgYkj8eOWDfy+KAkp9vgKdgDIosaZfP1i7hxS1iIaqHxyv
F+qtgLSirlJR71+eRnPKsohByrSu01Go1Uf0TU6ghzf/ZzBNlU1yMipynXBRDHFP
/Bcgj6/AKGVEk5AXiQP5h9F/7lt8BnEMY0eNls6f/8EraxP265rbo052g8N0RRiB
deG0pEg2HvNPsRjwaH86VhDP4vMEdiIA1qyELp5naRrmk5a/e1ihs38Wc1wwxekg
L6SksBy7GdFcrB8jN/aWHQTQ0MKMI65ywD2ca3OTl1d55NtGBeBfv4VCqzfWmPFh
XXwdTWvGm96MBVd8/wyP+j2tOJH1pXxbPrloZcFLxneFr9s2/ReHBWPz6oCeFsWv
I/ejR5PXKMRmngL7i8FT8QVMaZSg1QcKiTroyzTeQICKSIJ4eHujENVaCTRPYryw
TZzmSdU5+odgTWsUnCISoCxEqSj0stQbKnRJApbUMBOcuQQ8Y5+eZPmxVm4WAW3u
3A0feqFSjEbnglxpeHBZ4fCgPwjSez9ifhArj5/mRe8=
-----END CERTIFICATE-----
����������������������������������������������������������������������������   <BUGA1UE
AxMOYmVybmQtcGlyeC1vY3QxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNV
BAsTBUJlcm5kMB4XDTEwMTAwMTAwMDkyN1oXDTEwMTAzMTAwMDkyN1owcTEXMBUG
A1UEAxMOYmVybmQtcGlyeC1vY3QxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxs
YW5kMRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAM
BgNVBAsTBUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArNST
y+OzRFubwdvJONLbVo6yjVhXcXJldPke4XyUEOGg73NxxIhH8QLae8SPvalkq4Lh
NgZjDwtUeD34M/bciWvdiQMw/ePzoVDdwlx5fEhQNU21PKDQ4/5p8dQc14mKeJaM
bpfxmk/vUsDc+eWQMP3WXRCUH+eHV8JBfvleimbXrg2BdI2N2Bn7auAsUwShTFKr
jSIZcB2dXFE0+w1TUCKJz5qnPEqZNiZLczQ0JBcI2jSVaLswZ2m2SQzMGTs6JQk0
Rn2hQN5Y+pG3B2DUCRdlwoOUHJ3Sm5b51YrffXPWxFVbnDw06wWFQAqj+xgFpHR8
KCo+IV5LF15cdvHjo2RM9M1CjQy6SduprlB7mM0k6/dhPxe4QnzirtBCy8lgdRWI
qTh6nFVuX5dtDjNedXWEENc5LywtC5FxSQJlGfQEz00jyA6n/UfT+T5N5AS/EQn8
c0k+IuugzJcFn25MOjjbaaNF2dzuF+zrCJTraK2AYphgTRmbizND7mitRs1OBf9J
aZS3gGRctVPb7jApPQTWiTft+YOLmE50y5kmDXiuLXvDQ+sKPoASNT5mjIcXbtam
YJyyomjTserUm/xXsI4npTFik1eiv3F6oBrpE    sPN2OWmCAx1r0
JGQmXFtSkJMHXqQciy+IL+D7orvH5oyiYUR7AgMBAAGjWDBWMB0GA1UdDgQWBBSA
L6nHdXnbX6rvF20VwGwZMmMb6zASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQa
MBiBFmJlcm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAErx
UjHu/4Zo8xmGoJ4PDDwoaUyWOBt6B4dr5mbo8TBNTVIs86gFI0mTwY4/g135wjqp
WuospIBW0gCwU34gDqgYI3xK9YAVpt0HPWVGj5KFckrAAQ7FObFcUvOeQ4g8KJd1
mmnp4YsdtvRpb09m71px+eVxfpDvywmVni+Y5eouOQn0x7fzolGnc3RVZPIMqant
QYaVY1lPqB7AxJtOG8wyWiAbNUvurmekM0gVaTUdpco8GtmEVe2SyGbKuLGQGRFL
ZuWtcMtK+L3T5DvXGGiE2cK3HXnmYEYsHRdQ/Qe2k4OqdljwfTBIU1SqczcAz7AE
q82iRM6gOHnT8iYv2bgrKBDOiNMyyQx48ZRfJd+8pvox1ZGo8HtPmpcR9xg/s5F2
cqSDU/ja+7jhPFojhryUcl1GJ3+MgNzXJmcYuQK5IIzkYPrgU1vACOVnggFcO+nU
clU+sV0A3KeL4gu6Jl+Wej2B0F9kb7WbhA+qvLT6WlWheP0Ua/qeJUjqezyXZ11M
TC9SI1bzCJFKoMZz6tIm/C5QlaVGGO3TpxJ22dHaUnnQ/Eg5D1VngN5THsrPyF5z
0FY5OlZ4ztI6d+35zGGPCNQoeHJrQntjXWoz2rrRZloPq3SM8d/quVc8WO4z3Mhp
mmnJMrGb9nPihikzhujNSQ1KCD0si6ttRqiDuusD
-----END CERTIFICATE-----
                                                                                                 jKnqXYXrk0lFi
34AK1O8U/YpsmHDow/6bN6BKbuIb5BLudaxJr/MCAwEAAaNYMFYwHQYDVR0OBBYE
FJ6rLAI2MxO5H8ZDSG7zoa2ZeMSZMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0R
BBowGIEWYmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEA
UqEBXnTvl8RSqfFDpBtIk2RE5NUzAsuGvSAQydxOmq5ZKOOBjDOfKMjYneZ1u/S6
uJsqtFNYNW2JjFRkFmRc+NztvfOteU5bZPXA1vUjFcLxQdoNBFUOfG01+oDDKZ5T
aVpqIjqx0Lg8VanqInbgYkj8eOWDfy+KAkp9vgKdgDIosaZfP1i7hxS1iIaqHxyv
F+qtgLSirlJR71+eRnPKsohByrSu01Go1Uf0TU6ghzf/ZzBNlU1yMipynXBRDHFP
/Bcgj6/AKGVEk5AXiQP5h9F/7lt8BnEMY0eNls6f/8EraxP265rbo052g8N0RRiB
deG0pEg2HvNPsRjwaH86VhDP4vMEdiIA1qyELp5naRrmk5a/e1ihs38Wc1wwxekg
L6SksBy7GdFcrB8jN/aWHQTQ0MKMI65ywD2ca3OTl1d55NtGBeBfv4VCqzfWmPFh
XXwdTWvGm96MBVd8/wyP+j2tOJH1pXxbPrloZcFLxneFr9s2/ReHBWPz6oCeFsWv
I/ejR5PXKMRmngL7i8FT8QVMaZSg1QcKiTroyzTeQICKSIJ4eHujENVaCTRPYryw
TZzmSdU5+odgTWsUnCISoCxEqSj0stQbKnRJApbUMBOcuQQ8Y5+eZPmxVm4WAW3u
3A0feqFSjEbnglxpeHBZ4fCgPwjSez9ifhArj5/mRe8=
-----END CERTIFICATE-----
   ?VybmQtcGlyeC1vY3QxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNV
BAsTBUJlcm5kMB4XDTEwMTAwMTAwMDkyN1oXDTEwMTAzMTAwMDkyN1owcTEXMBUG
A1UEAxMOYmVybmQtcGlyeC1vY3QxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxs
YW5kMRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAM
BgNVBAsTBUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArNST
y+OzRFubwdvJONLbVo6yjVhXcXJldPke4XyUEOGg73NxxIhH8QLae8SPvalkq4Lh
NgZjDwtUeD34M/bciWvdiQMw/ePzoVDdwlx5fEhQNU21PKDQ4/5p8dQc14mKeJaM
bpfxmk/vUsDc+eWQMP3WXRCUH+eHV8JBfvleimbXrg2BdI2N2Bn7auAsUwShTFKr
jSIZcB2dXFE0+w1TUCKJz5qnPEqZNiZLczQ0JBcI2jSVaLswZ2m2SQzMGTs6JQk0
Rn2hQN5Y+pG3B2DUCRdlwoOUHJ3Sm5b51YrffXPWxFVbnDw06wWFQAqj+xgFpHR8
KCo+IV5LF15cdvHjo2RM9M1CjQy6SduprlB7mM0k6/dhPxe4QnzirtBCy8lgdRWI
qTh6nFVuX5dtDjNedXWEENc5LywtC5FxSQJlGfQEz00jyA6n/UfT+T5N5AS/EQn8
c0k+IuugzJcFn25MOjjbaaNF2dzuF+zrCJTraK2AYphgTRmbizND7mitRs1OBf9J
aZS3gGRctVPb7jApPQTWiTft+YOLmE50y5kmDXiuLXvDQ+sKPoASNT5mjIcXbtam
YJyyomjTserUm/xXsI4npTFik1eiv3F6oBrpEO4/06xI2n6+YfE   CBoRJDQNygPGJbC+h1Gwo7Z4Pzg8Lw9UyU
BPF1fJVV5XgXx3uos1UWR9036TlV7IMx/EfAI4JvoxholL64xvl679bqXciO3jJL
01UaU0dFszA+uxa9/kAmxgBSXzg3UJqENEQfQHXzbVC9ozDsat2V4k2WvsGBkiQB
TyqX7KonOWUzA6pvR0rdvbehKpVGmJVJAe027dSoyoEvHdh+OeO3INZ/gBO3T995
91dXuveHBGZXdY/24EhpAoIBAQD8rqgqTF2Hb+7pn5XChtZx8ySnwMTRH8Alrca/
gkdSozj9ZvWtpHQFsHw8PZ/e9TmPFKKjpaBh3n7ovYUfPrbdvm47Zj3Ip4XW3p5J
a/9/gu/ApQ67mfZ8bepZ1DranS8ojFtDc7arlGSq7VV3GFFKnJo/MJVavBGCiEIA
invLbxyfNbtD4EuO6MCImo79FQOL5CjvGq8gDAeENk37OHMhdRZf0++an529GFjj
V+8OIG2x7QU6YXDHAKfoNLSxkVc1UGldDO4UT8PqIZ5CZBzK4SAI5JP1DRVUTawK
/1vUeaAg9RyQbybHua8vq/YMTL1O9KE0Zjy1Hm7RNUn05vh/AoIBAQDIvYg6H2kv
nnSylwTFB8a9aeKwxfPYOe6lidi8lrD9+NimUnLOYL0vmzIu0WugDYsQqIFtQs3T
0CjjOGh+ZXiqteWB7RF/7uAqAIfBtk0Qapk/4/kN0NBetpvLP9Q0zyzIVoEnjYiV
0c+SKD2xZXad+mXP9j0NVNe7yAxSv1cQX8cN9/bz3mS49FR9vysKc+8bBbD1ioBk
g5BkCuiGoQ7VpPXphh71/YmMuJSTTF24Sv9EugpOVLcGEnJkGyT9PH7MyyWJ0oZc
P27ddI/E1kP6nf/OjCNxBCLM7zFDxtuu0klF+XcFwpCLvKcbXbmRB9/TJ6Xm1u58
7Rn2PnXW9fo1AoIBAHKIkH0rxDFB0V9gELft+oIIHhNT02KfK69oh3ADE2UnywtB
ghbFNjnl90o   Azv75HbA/PlSAb
L7b6Khsll2wqEC18XAyZ0qZAxQxMDiXA1JjSuSpK9D2gfNrWXUoaRx6q+FfLe1KC
Ra1lYhS2V8iGlpqHAZnvzcQjYsMDX7w6YNtUSgodbwP8lOvO0E0yQF1GEYLPV5XK
ftdBUJWpnAfrlnqSSbt7h/ao17JwoiZX59XuGwF41RXsP4duT714ZjbDIjf5c9l+
00ILbYbU9OZ2pc7bgktn1kc9zh1ulDBZV9xS5ymeR+tXVkSSJrYMeQch1bEpdj7+
Hx64pIg3GFb2TrsNu6qUKPK152kwZT2yE6IVVumrh6OgwrZd6xTRjjaQrKecukx8
xPoWu27PolOlxkuO2AR9GDeo2e0kjyhoYvXTOhwdazPRryiMKLrztzpPDG7NssTb
7smNT14KKOYvqtdTPv+jr7hyJKC9jvkc/pqPJIi4bRdDvXmXdEGesoM4+v4C76BE
sayMt5vt4KC0/lyzG5XT50WFELoUjwiFDUWBtUVovIhNkBGbUEMU6rz5feycPQ1t
DFqIDte5fVs71ML44jAgowpKPgh4SwIDAQABAoICAEm3qAs8NC6Bz7Bpr6CaOfkm
w+r48FIk2lL4Mo8T6OuU4na+j68qPgN++k+dahYpe5CFJh4sjl3P3jZYoBwImV1k
7B1zQaEuj4/bVQ7NB4Gyb9hKQzn8HpJqhk1W8dWjDxhni2TJSKyjv/k9bGdwyP7Y
co7HzBSLrsiAPgi1B1k4nkU7E8y6xYhzjIYsTcMZnFtggIF9ujRjopQDVnr03d3l
lR6147I9H0fAF6xOr12O/dn+dTvL/C1tQ19zDLS6fS4oEkvicfewj3Nyc6XCVJxx
B+VX7CyHMDDKqjOxZJtRSNDF2asn8wlAxlJKZJnfIxArf05kaczulEoCUX0s98+U
x3piE3oGD6KF8/C7bKFtUM4eIHwtaTKiA79wdW5b4PiY6bz/JuNLTvslc/uojRjE
0/4LsFRXph4PjqD6CUjD3Euz8sTvSX4   Du/KpJKV/rkJTw3DPAcHH6hb7V5Hm6eai+/T5YgNgWbFUHePZJWXdO
2dC7Rvi7scAp7Mtu+BM/G5cFekVnrAG2NkkXYrGZLml6EhjgqmcqcBBitR5PLQAV
kN6Ban5KjgrdU/bvcX4VW2CWDc9O5JFPNCWtPrJpqkyhejfyJcOyp4fVMeyLUm2V
7Aq8ZCwv5evhCA58vLTT0A53b+sRBNK5jky1qD9lr+mYAmDPH13pHxSVDwDOaIDH
2by2RTO+vOO05IBKwHxrci6YMOg/9ScrKmyxzO0CggEBAJFHSf32maOS5BYT4anO
1PBkX2FcAfvtAV/ggXELBhDoNbM5XEksDf8ULJ9hhKiS5KArs2+lt1yh+9VmD4na
WhgCCJWdQtr5wFXliFqTWvaUj1CD5s0u4H6LXfkcurF1do2OvW4oqj7zV2wJn4xx
SAVRILn/FXQ+gNswDmsceyAokOD1Ik6gFvkcKsHOxpGMEfHWjplFoWIdLTSaCGrW
yOuptSdKn8Gbuh6Tv0NTM0ibTl8o3SiPet30H8F/O6fiTkpcg1BZgk/kwJGZOCtW
fmA0VNvg5A141s7GFTteAcNmAQ2ZW6BZjU70O2Q80n252yzwNsr3piXXWsCxt4rY
/jkCggEAFUebBgXAsV5JjdZA8Ty6/mlcAQzxcD4Vu8dX+gdbXAI1UKU0QTMz8cdH
0Zeggbm2WVXOVG8VQsCPYUPTTtjF96RJt3ys9rO4We9Y1T0E21EXEvpuEx5Hx0Mw
SNRwG4QJm6s0FFwIJcL6/8JAfdwZtKrGEywWTSp9e43YitKGZPbU1fywnhuTvq20
4Bdn4cxIJ/wLmCJChfyBLY+IxzsDDZWAPGciCR0EkA6LkJ6ZW5lBIJh9NdVni6Bg
twdQXi0ZsD9CKdt0Ikffeb44/s1hVlQNNqMbK9C+nXOXZx9tigAOY7LVHWr2c2C7
X23nS24jrkiBppRC+ibzWHA9kX6XhA==
-----END PRIVATE KEY---   E--
-----BEGIN CERTIFICATE-----
MIIFtDCCA5ygAwIBAgIIAsp1YLZ8LgEwDQYJKoZIhvcNAQEFBQAwbTEVMBMGA1UE
AxMMYmVybmRocy0yMDExMQswCQYDVQQGEwJDQTETMBEGA1UEBxMKUmlkZ2V2aWxs
ZTELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMF
QmVybmQwHhcNMTEwMjE5MjExMDMxWhcNMTIwMjE5MjExMDMxWjBtMRUwEwYDVQQD
EwxiZXJuZGhzLTIwMTExCzAJBgNVBAYTAkNBMRMwEQYDVQQHEwpSaWRnZXZpbGxl
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMYjhslazP4D/eGs
B0oXOudt586pw2kTtjXYTvIdVaLOyoYrIodalpi7B3353YmWH7/WPb+rIXxNMJTo
RCrNRb7d0fnMhg6uBSuB2imekkgF+szRY6u0ykgZNJaySZAcGnO/vkdsD8+VIBsv
tvoqGyWXbCoQLXxcDJnSpkDFDEwOJcDUmNK5Kkr0PaB82tZdShpHHqr4V8t7UoJF
rWViFLZXyIaWmocBme/NxCNiwwNfvDpg21RKCh1vA/yU687QTTJAXUYRgs9Xlcp+
10FQlamcB+uWepJJu3uH9qjXsnCiJlfn1e4bAXjVFew/h25PvXhmNsMiN/lz2X7T
QgtthtT05nalztuCS2fWRz3OHW6UMFlX3FLnKZ5H61dWRJImtgx5ByHVsSl2Pv4f
HrikiDcYVvZOuw27qpQo8rXnaTBlPbITohVW6auHo6DCtl3rFNGONpCsp5y6THzE
+ha7bs+iU6XGS47YBH0YN6jZ7SSPKGhi9dM6HB1rM9GvKIwouvO3Ok8Mbs2yxNvu
yY1PXgoo5i+q11    M+/6OvuHIkoL2O+Rz+mo8kiLhtF0O9eZd0QZ6ygzj6/gLvoESx
rIy3m+3goLT+XLMbldPnRYUQuhSPCIUNRYG1RWi8iE2QEZtQQxTqvPl97Jw9DW0M
WogO17l9WzvUwvjiMCCjCko+CHhLAgMBAAGjWDBWMB0GA1UdDgQWBBQlh5X0zldX
8QbnRNNIMcK5i/Y78jASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQaMBiBFmJl
cm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAGK7nQDWQArq
0Yox/f78H3XljAxdxgay5mz5+TiH+rh586K3RPZ5fo7K18cudiymj7fXu/Dceoy1
ABxNWd3+H3ZeLbA2m9/EKHS8wCZAmUPwIgVj2hsYwtSvpxHBNpGciL/dCNTSOLk2
9bq3JZB5co68OmX1p3WpBNaMJ9JQhVpzrUPA5lXujrNnX0FDBG9YL3kO3OFsvv7h
YQdAwOm1lpypDqtcZrZSpp3Rx6GXNE+173PPCS/uKSsdeSJwfpDJNDicaB1baB+C
VRTeuAcxCGGRlFwD/a4RlMaUb1WYRb7w7qxpmi/ZVd5su3Rnttiz3xTMRWqRx4KD
bU5onMe+XdVMbJV9Re1bAc92VjxVf5QxHg79Wh2e46KFqi3bGz0nq03MLwCuMjKR
Df+WZ+EZbAT/pOpOeC/AbyQV6j8gBd0PYRsQNySczfr0yi7FXbN5orEWjP7lD5Jq
sIslM7SSDBMy28EMJYFAwIVE8JaPnh7L9gC+4jOpRZSTCDD3zLoBNH1IFkid1gN6
+9B1ZV1pdzXb/UMtjv989mtyXHM26dM6gznwFHvuZCnAhtrdiySsfHaZaQm7WeCp
lT7rzlUIvIre/92x3gTtj25MswUA6PAg1OZckRgsUEFijFZTXjBa0BAkJgG5D5JC
cg1U/Ygjdtf1CWrWk7ukf6XkqHNXxwvN
-----END CERTIFICATE-----
   GqVy2Ru+E10Q3n1F2UgD0TotlziyoO3mUt56HO
q3kO8Gsy5fF1+R6IBiZN7T0csUyvaF83+lZMgElT8VqYeT3vhPGxF+sRWOGbFUEr
hSsvvSIHhsrf2+wMK5SKDnd+4omaaL7jbP+kodiba0r2/XJT28iml/UwpUfjcZlJ
4MtgepgQretDafXst5lHwW1GRH0zuRVUI++sYiixx3LqhLViTApr+ixXHjucHfzn
39aSs3H+rz4ghe8O8cgpAoIBAQDo6MDF3tHB9QmALnz3PNBgHZfjK+S0fpXaturS
tcGbv2WD1nwonJ6+h0m/PY5Ak9pbka8vQLIfUR+W9nrlCXL57vS9NbaVt5PnGolp
Ls4b0uwygswYCHY26rmdLR4/0uzNmOhNERf8x87HNY77AM9vjBdJ2TvIaYLSeOfI
2unkGc/seyh7RePhBdmMEDFb/7aM79GtufnI7pJWJ8DxiF2Hb0KTYfwaE5Zp3qDV
S0nLhDPrgDKxNQJrEnXoepCgZcQbIZI9pWq92XiWExXwumcBa+e9lFDrNVtDZBM8
I75EuPKOwNJrnB43BAqBXX7TvQuBX5RKDYfJlbDqwcOdsZmtAoIBAQDRhSH/hWGh
ikcmUYim5rQT7MKJEmm6Vg1wYso6kyQdoDgi/extRWGNvzlLzKpx/C463OVHrWfP
JNtvoMxR2oXHLDaF8lWXdyfBX0C9Ib8od21RFaUlLhoY6THwBeePvpIGQW+tXLQJ
sjK0kSI861l71tTJHfA/Ep1ZPZwnT5D8xSDkhPJh3qe/8NG6jzDzAfv7d8nknfGS
OhJdqfj75m8J3+5WTLX+AO3JlgUtDxECvaucZ+x5KXk0AifAnSkKEsOUEsNK0Wcl
NIdGqcTX/yNOl1GIUxjv/pbTj/Iuu8odz0ELGrmtSBrcLbK9a5E6AuQFKb0vpMRn
TBsEPdE/lnJjAoIBADO4I76MuTWBzUdKi3N3bKo7SBQpFhNCnNJBlimONNz6Bnfd
NBrslI+   HoiSbPa3xJmM6Grkkm66bqo8IpH6cmjwKTHoO5nr7mUhCaovLZculY0Bxz
URDxKBcPzoHpl/MCSpVpJAShDBuU3wT7jrGMP4P8rts2QwFA9Mz6DjZa7l85oCNa
QeYF4hGA9AsXOW69fPMU+hHC34XP/GznTQAVkPdXLIh/1LSRru/5gOt8WXm49LKR
+C/DnrLaGZazSNRlZMPFk6zew7I+zXk96bxYGDGHnaFKgyGH6qkvWtoa8dBe5XXv
uYot08PRwOdzNIueSiTDbbF4CbQo6m1m86Jb4s0CggEBALSxZIjBt1lhr8rUNk36
WQN2BK/COXyCCkUKbe3mSBdkvgUviF8UnvVoHTnJ4JU9L4GEUBho7EYxOy4iNxPA
qe8DqmIKhNaD5L1YMLTsDbgQhy6OxEY0ZD1nn7Go5fOKHtVWScHxWTOjgydGo4h2
UE4FEK4CK9e5bgowoCMm85uLRrrODVtqcrGONtH1+/kXlQFiZbPMozHA82Xj2N8l
9E1H2nyC29Gba3eW8g/SFpGOkhnpZn93zReVZEMxRttxI0rog5Ra0+G6U5AVibXe
S8zTo3U2dSNFJT5/vhWfzse2nhm9irRuovuQTb4errihFZV+UbJtHxUXBZW62mNE
lJECggEBAJJDrioT8SyrYmLorN5lyQZQP4NRqonUiwLKwFrGUxMDHnxlX4LSqfy5
Sm7xNFdHzLraywchRFRI44maBGuuKb9EkbfORbktljoo3aFMloasfR+9nuKcf64A
gowvXKHs8gq+/pBpj6l0idQX0N8OMdV+BhQxlhwdY5o59PLA1GOCw2YFJQq6M/m9
Q1VduVKzi5vYLXug8uktveBpGbTgAeHddugTzIruV3Ia6Hsdr7/nTOJ/xN3vfBbp
+E52aXa9DyZS90Ycuv4IZKgF3qv8bIXcarYYIY8cQuvOhPJlWx06ZbfxevS6yXya
JwAmn7Rtzr9Ls/T5UZBP48TwgnHaWAY=
-----END PRIVATE KE   IY-----
-----BEGIN CERTIFICATE-----
MIIFrzCCA5egAwIBAgIIAsp3Lc8sKlQwDQYJKoZIhvcNAQEFBQAwajEVMBMGA1UE
AxMMQmVybmQgU3RyYW1tMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFuZDEL
MAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMFQmVy
bmQwHhcNMTEwNDE4MDAwNDQyWhcNMTIwNDE3MDAwNDQyWjBqMRUwEwYDVQQDEwxC
ZXJuZCBTdHJhbW0xCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5kMQswCQYD
VQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVCZXJuZDCC
AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAL6fJTwrwUh01SyMFnPwdFji
9PuRePvTT8g0aEqd7j5HaEu7YtDf/b/i3j+TdyUkp1hrp/8UhcLzETT6XuHlLP/Q
96EBrDWn+q+VUBLICD3dvVBtztwwDQvTHFN6LdNNhWQHjJcU4dxkSik2b6N/TxPA
CmJKVDR+OSndbeNqaIaRkUzbYkd+2rIseY5Xp4C/0ZFJ9gXn0XEMnE4BxrTnKptS
FRsNDMnQBwdBExY0xvNmyaP//p0Uo1csXcpVgbayhhXLO0e5HdeJJaj/Rwz0a9bu
TYiIhaMDrWJ4B00vWVZ67z17rh0WxPSHPtv2sZj5Wlprwo9R0zXYD2lKyFoBCMXp
oPy/ipRL1rk7ukRbn6+gTLH6Yrvv3XcHTlIbmkLK1YH3siQ+WQnMEYlmUtTPNC67
Y5glqM/gDLFBfdQYJhFGzi++6PUWFik5u/bqikyqdU+avyCjI1GgAyYqD6Tej1vq
dC0Du9RO3cb9Qr6+hXGSwNW24wD2qd8V/1FIzQCwjzwuqKK41auC/x84GsfPYd1a
bu2/MppkzJ    4Py3kaqXlJdvLjRZxRQNcsqLtG5Izq8jtT1HuILT33s9OXgjOQBowM
bcwji2yWWTicf7rpHhNDxQkUwluzC7FOzPhmstRZJ+16TSQofMHFYjI/oKIXpve/
0hwCcg1Gh1bP1P2we3fnAgMBAAGjWTBXMB0GA1UdDgQWBBR6dEEshdXFIheVx/Wh
8dJ8lZKYqTASBgNVHRMBAf8ECDAGAQEBAgEIMCIGA1UdEQQbMBmBF2Jlcm5kc3Ry
YW1tLnlAZ21haWwuY29tMA0GCSqGSIb3DQEBBQUAA4ICAQCGmoMhaWrX14U+vBxW
ZT66oOkjVPU1LZ1m3iC6SPcHfrvt2YEW2k8XU6Xe2UpbpU4cOvoQk8CfHjlY4v5p
R43/P3Ksz7vTJ3S9p0/kSrI/5UPc/ANsmyIFaiPNtQZI9O16rKBjXtNwE11IviJ4
zioi3d63cTfC2m0++R/RRbbYf4E7F8GkBBQiwEv/W0pNd66+xAYf49ku1mF2BLlo
7F6Qs/GFKSjmScMqgD3SXZFaNi3BxE7iUFVNGttirACfrD7iYgP0U7nXN//hB6H1
i+M9oA5X3dqBBZ91lNY6XXaZ0gmLNxmLaaFq+jzyiXSIL22uAzOGIqRbfZWEIG2R
TB3HBSKXkhQyG4bhiNlaCSy6KAaoyaRxAa8A7cEGguvWFjWmaaC+4XwC0+pLB7XL
TuZNJRiHCJW3CwCq6pGJAK0tG/b8P3xuCsVAqgKjJLFwBw5qhjiiG1ewZosFu9/k
x6GB6S4jf2IsMrdb9h0JdUcRAVzVU1DMylUX3giUyW0ObpfNX963MBZpRwLyRazi
n38Rk9aEkbw5gaz2TvUIi3p9AcWHoDQ7Sc2ozGztbJRpMSpMQF700SfN/M7IjccX
y94EtZU+983IIzPwMBfN3RHBQ+wXIAkT+xBeVmWyEzFHvIg7/KLJtvvuwK8KZtni
0imO64Chl06yJkTa9Wh3/VZ/fg==
-----END CERTIFICATE-----
    86HNsNtt+5AkthFt5UTGEmd6nf+spNB64w+ntQLF5eBuvBFIXf
3bxHhEDnJy9KZUkXoluajqQ9Enkh3P3Sreu92nFFa+hrOsbYxMCTwQ8S8NcJIrrQ
pTwpF7OxZeWCsjIyJnJ64yCRJQIDAQABo1gwVjAdBgNVHQ4EFgQUmhZwAB36gSWL
1UUCWeYPFoPAJK4wEgYDVR0TAQH/BAgwBgEBAQIBCDAhBgNVHREEGjAYgRZiZXJu
ZC5zdHJhbW1AZ21haWwuY29tMA0GCSqGSIb3DQEBBQUAA4ICAQBkVXaufRt55Xwf
lekF/84Q2IHM0d0UFNcBp69MSoMn4u0SPw6PSc43byEtRdvPze0ecb+ZC1Bpx52Q
wkU1jXmwSqFdHiRS27I1EQpnRZoyhBh1brWiSHcoXIRXEcctS6j1p5EhXAhU5zIX
Rm0WWa1lJ2dYjUhP7i97OFNlQ6B2SicqHKdmaZGG2z1aUr+gTOAHsn2pzQrwQ7WG
oyTDoiUURyGS31rWbObClDYpLyLytUeITsQO8r0rpc6c8Lr6XKzBj5qT1In+QS+B
fZsTp/qsnA5oJqeKZcZD/MMKARfea8SEjpS8NQJQ6nD9GzYlLi1/Ih9JzgzvaLjG
KXzOZILNsEZtphTkiFee55M75khgOlkyr4XlRUi0UC5tjxsmUlcK2JMbdwwXo2KC
debNpRiE2m0x1yaMlqkxccGpI90T6/M+0/Q7gWVDeyf5M39pYBI+03zYhRQTv0dr
BIsk2E30N2mkON3QapemUJ33ErPxzk96vAmNRs1XrVzF1wTI3he6YVfr4Fd+jwcY
P/a52kisGMU8KkhR+p/qLP5rvdeH6u7xGxTFrL6yTIx/jd6630BOo5LpJCFRJWqp
9YvmpMt+O/lLDYY7k/TZyF6yaB65EGFiOLu2o+7ayBC2ZrQGyje6okkyOyYNrmZH
36x4Z6hfsfWn/x3ZGbT09XkiUAjBdA==
-----END CERTIFICATE-----
   J--
-----BEGIN CERTIFICATE-----
MIIFsjCCA5qgAwIBAgIIAsoin4bwLzEwDQYJKoZIhvcNAQEFBQAwbDEXMBUGA1UE
AxMOYmVybmQtZGVjZW1iZXIxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYDVQQLEwVC
ZXJuZDAeFw0xMDExMjEwMDMwNDRaFw0xMTAxMDQwMDMwNDRaMGwxFzAVBgNVBAMT
DmJlcm5kLWRlY2VtYmVyMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2VsbGFuZDEL
MAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UECxMFQmVy
bmQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDQo8KCS7hFm2j+WDiH
5kHusHHM/ytVnJob3Asui7HY3C7VhuIQQzjjy5WYrMX4pACF/wVODgrtUf/vxF5y
7f08nwHmrIgfEn544dIunHLdqNSxBiBdusxXdOgHN5e0So/6SLjt+lgRyanY0TSw
oSwYXthKjtaCb5hQn1obIIE9VZtb0+7nU9CdMFbSZNJcCAqLcAH3meTG8piWJv1H
2AICaHaSOekAhuOpiT01PjN9TnpdjC0OPaaAWaC5NwrVzV2MvaygHYAMAASxt1kj
uGBy6gtOOKeGUL4rPpTyCGxpFRSnG/OFmc2Zc4BsdqpdCWrT5+qYLhUnkSg6Q/TB
M422XQvHQ4mLjg6bXmG4+bFizQyiSAaTwSJP51kpqoJsrtQikF9wx2LdcJmheLpQ
ZAVGAH22zblXX6JElLCYOjgWzsk5wV0aACEQKFcztdiB6/TLCrjYZV9bj7cg5K1J
RrPeZ39ZAGvuKHTgm7+pacc5n7G6gveMmk6ujX1looFJ4C+2sujmaoPq3n0SGPDK
BKuNy9W3A4gDH9   Kt9DVVSf2VtOB9GA5ojpNOChD5reZq2FzqdDlCGJxQirRh/QG6WuQc
zTMBdu46hezjRaXIyjRd04JxbuUJyaOdIk0mjc90mzZlY6M3hf2R5HaVqfmiTW9a
F/1laQqpd/HLglS88y3BaCuZTDz97/yVARWv/BfSBjm7tMltzGlZAnA+8ghR19xB
IwJ+9Z0Eca9JdjNyAL6IBsXzLIKMOdHkajTFmBDaj5/dt+LGK1mzGaTpK7y1YovM
IAVsJHu9sVXBHVxSFTLxoJxzHafH8OFXj96xBqkCggEAP7zd2L2L/kbADgtCeE0Q
aVJ/SPj0wEt03lFBWkOpI6HiX43/ttlwnY3iJ+O9YRLRVNqEGesiqWtOwEVB8cUB
Nry3XKvudoVG32XjR7Py9lh8gD+5fLd3V0W7s9DuxjPJ6NdvuEnfASEG4QrDJrf9
Fuj+YYG6ng1Dt9Hw++4rpo0YONlHc7ICEBvXglnK7OpcNsnPGel93Hc5t6Cs4EmG
plbVRuvpRniDp5DD6uNty+ubdaP/4fLgFqBNTUTiiy7R5rJ1tGelrEMc8OJIfWsW
JtO6Q9YO7pS89130PwuHKofEY0YagEvpTLqeCKawnDq/UGOB9VPKroLqNROnCMak
owKCAQEA929cNip3Jbwb+xkinsOUnNIuxBS0EPAAzNbGefzZXYwSE+o/QVEgcvIX
QidDyk57m+ebSn+ZDKl7DoSSJZHEItpj+AO/ExSF9uRIMLrSdcVxxn5umBbtB2Vk
CaaN4wJQOQGDILJfmDrR+WewkwvK3TOendkE0nAQquUd53AYPLLE2Pt4b00X4R9T
4Wbh9f8S40hf+52P7D+DwJcye0Opp45exF6M35a36/8aP9Y5Ovzxp2sOQe5I4X5R
3sfhpb4waxu3CK2OhwZxJpCJBEnkvh9q3azQCVo2akeA2VP1GjRo29+lX5e0ivWJ
uajP5AnZ5mD/iyFu5FUA9vALOhMTeQ==
-----END PRIVATE KEY---    X6AXzq1sx1iBAMrKp4tc4fy
eAYDMcpSYYPybzUCAwEAAaNYMFYwHQYDVR0OBBYEFCw4K/53bEVBlvtbo8LRgV2Z
nzSNMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEWYmVybmQuc3RyYW1t
QGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEAVE2T+lMoCJTMJfIVH9PXIfmG
+qxPy7a2/0eozV2a3pcNNsic/gU5LPn9FsNiLXxactdBQdeeWogS85gQaNI4CRK9
pEDkziGi119EhYT6fNURQTiUoP20uw16NzLVigSYuK9a7rGDHYaQ1/5VG0v0beVv
jRwoIIN2DvhQPxsaHMaRlh/uw4YMZzVW7u1mZ9c/ucWb0xuquLFsFC6ZQwf4Cl50
RSjh5d2yDhqOXn/smIQhz0fooMhTFgSDMOJ1/8CUbSr0g7xeRb9sjBvpgC+BYHiz
Ej+Q1OlhjBCqY2YeXkG3rbvpxmR5gdgJD6862+9/bta0XhLTbzHVA2Vl2B/cUGgD
DGYoWORKzSE0S4eJQZiD4/izVQK629Oh6oC4UxLAb1kW/4yNUh2JH/hgKVdY4B8n
Gl8+TQMFOR8pepRj4+NFRLDAsEr/c0bhNwye+tq1fFg1kFLLHfE6xg5InuW/Iz21
eY7J8/Lz4Qghu7QIKmx3hstRBPfQM/K4a7lhL5h69J0wZfI3xmcDhwD1alxpWD3N
OBM45aKvuvhGG3cXNZsy50iT3IPb3Ue6XluunLk2rDg2FTtExdVmHPKh51elPWAG
o7rWV3nBdzDEUwlHeGEbafaIlT9P2G+IDE/hI1WakHVyzg+agVajPAoO94DU4mkG
JwVNaddSL7S5AilGR4g=
-----END CERTIFICATE-----
                                                                                                           M1UE
AxMKYmVybmQtYXJjaDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJ
BgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5k
MB4XDTEwMTAyNzAyNTI1MloXDTEwMTEyNjAzNTI1MlowaDETMBEGA1UEAxMKYmVy
bmQtYXJjaDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJBgNVBAgT
Ak9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5kMIICIjAN
BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2HVi6yL+kyZr4Io/aHHTtwIkeHef
DAUGS8rwyFUwJvNmdE8qrEKQg8QEcL2cBDHKjo6SHsER+qSduuFw3ZtzcRxzyv4P
PX2YvE36y6LsscONJE9jDYVCDvuA7k8on++1Ul3M3BmVgr0aYB+BCqB+L9b1YjPI
EeYpAe2sZ56lrspiHBE4vJYKwKaR9YrSPweWaUSWX9I+vd6yOwLvP7xH5i2zbLdU
NRp/LYmqou+cddQsHlbzNJocc7qnvwzqFKhY4GvUqlSafkmHxgrks6GTWJ1M4fqv
rnBbY7x3uKd4DstJ1hLBgsXKhAdKLb+jb4UlWxbXqXD8UJcbKZ2vRWPQJEfHuNkg
6UIJd+VEg3XTwX3cacnBFqKhwhjYPWCgHTiGoMipfDi063ELxUKwr3C+gLNoHMit
dPidl6w0VGhrL7zpqfkoRICC1dbcEmb5u5f0xz+jZbXRHki+77pW6cPGgjbO6h+c
8cMnV1pc42tvzR9kChZ6ZD71rA2khQVpaVduh4wtEXfAEO+G32g3AIj5sNtJHqAY
/zISqOtBR5bfxUoa+Rpf2gwR4o3dRaymi5CGYEFHtJTJYD4MbyUoEqYE21PEOVyN
ZlxfmdaZxRUUusDvB1HrB2szx3CXlT3y1ZRbugUTv   LT3tJDAt7GaCJUS5QY1qU5VHgQCLobqjHs
YYRNZG3CFDqp/EzhCoIn/ZF/tg2z76mhVPFH2L5J2XwkdO/WUuuYSYyV+3ULTwKe
P5JNQ6+w+coSW/J8nAIptDEzWvOBbdAWoee7Xdtf1FWCetDf2/W42ZKyKu5m1Ou3
8TlvaY1E865LVRsSpFqxPGDfiEcpghRISEars098bjQXI5+Zn+Gi+xq/EZQWXnx9
aCxaN+Z0lWdBMyJl/RKhAoIBAQD6gFr8iNpp/xT+8/IsiloZ3VOT8wNj60P174CO
wlhIvU4ZH4FqIISI1LZ+GvaicLA/pSqysNtoGi+nV/V7CELvMz2Yis9FcNKbiwMi
yvVUt/6n+xr7dhLcBVW0O8QktxRdrFT7wQhA0FD8xp8s4p0eexeaTSUrdL8PAhei
CwC5TNacfngS+frqeplKI6724WcpMEUq7d5/rO3ClWbVH3O7t3MoelnXNF6jq0OI
RZqaH1ZVU5GBOtBszq0mNMXH5ip/+Yv5pFi0TldmabtzkbGNYgeYmBG6PSb1jRHM
tcfZ9qJFCazbv5FDjRrkkmV+jZs2W8bfBTXzJ6Gyk9V5qVPLAoIBAQDVOCuqYCiB
juT5axEFVqHG/IuNEFfuwQSiywjDB0v6B1FWDXMeydRQ8eWMiWEWSD2sShPXe0v+
P6O9aNdVzHnIfVDkJP69Bu5GzuOgLlhWmjRN/PcHUSlJ/NMHoGG7RhS7nFSeqCp7
Rs+3rmkogp4SqTzIPlvBU/rkTlyRCP9ykfHi+/dWCmX6Z+6EwP5S1j0ku3YBp3rK
ypi9qa87ImsSMiWhYfexuX2rJZ0g/He9Ur8jNYe6hLYSe26bw4W+ckzUN2kIV2u2
QkQ8rI6+EgBCnXltkqnbLBiRWH/PfdO6oA8ynaPa66zZOnxdQdYKQy+KU8qk9RbH
ttU7GensB3DPAoIBAC+3q51XZGO0l4dJaORbJnau1nDkZczuz+9VRCPtmWuhw/K9
MaXJs/Vsr6a   O6SLjt+lgRyanY
0TSwoSwYXthKjtaCb5hQn1obIIE9VZtb0+7nU9CdMFbSZNJcCAqLcAH3meTG8piW
Jv1H2AICaHaSOekAhuOpiT01PjN9TnpdjC0OPaaAWaC5NwrVzV2MvaygHYAMAASx
t1kjuGBy6gtOOKeGUL4rPpTyCGxpFRSnG/OFmc2Zc4BsdqpdCWrT5+qYLhUnkSg6
Q/TBM422XQvHQ4mLjg6bXmG4+bFizQyiSAaTwSJP51kpqoJsrtQikF9wx2LdcJmh
eLpQZAVGAH22zblXX6JElLCYOjgWzsk5wV0aACEQKFcztdiB6/TLCrjYZV9bj7cg
5K1JRrPeZ39ZAGvuKHTgm7+pacc5n7G6gveMmk6ujX1looFJ4C+2sujmaoPq3n0S
GPDKBKuNy9W3A4gDH986HNsNtt+5AkthFt5UTGEmd6nf+spNB64w+ntQLF5eBuvB
FIXf3bxHhEDnJy9KZUkXoluajqQ9Enkh3P3Sreu92nFFa+hrOsbYxMCTwQ8S8NcJ
IrrQpTwpF7OxZeWCsjIyJnJ64yCRJQIDAQABAoICAB/2dn3vi7NeM5+DdGWdaMxg
S47UKJdc/l72PuBKllxanvInT8qeAcEkFy7kiQ+mUE4222Ex1Yq13TemJbIFs53t
3iSwmcno02dBcSmi3hYHH05fWeYCD/v19PXmFl+QbK4zJeGPUJ6o/lQw+Jl2l4LE
RO5nI4WoAvWW8/7j4+i5jKtstFTMClGKbkKdH3zp3nOuHR8JfHrd/3JBVtwCw4wK
5N9R79gc0hPO6omVld3EgAqExwI/f5p6IJ0/SXGnnIVLKX7+BffQqOdw5z8Jp/zy
zfiVxVRWWkvVsovBrpoKmLdhGNWG0nCHuUzkgQTvxGXiSZY2uRburfL/JifS9gqK
/A4R8KX9/ya6sf+XNN4PoVc0StICWiKUcMivzt8lbtrv4wQVrfDiCkHys3r9Ax0b
SRgzgRWwYuC0L1BCPO44S5cxVjsmCSI    uvv39AcoMEjrk
clmZJJMtIGsuAl+8MP7iNu0CAwEAAaNYMFYwHQYDVR0OBBYEFCWXznkfCtduJp7c
BI5ji7ksP/AwMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEWYmVybmQu
c3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEAVchzAtpDzLZKX1Tt
l1WaVA24WdCeLHaQp7p5fGBSePxrXcbEKdXAC5rATqpZzaTUXHp6Hnps1xrv5T1i
J2iIB8MAI3ZvRVIwuT9yBY0eqZgriATFN7PVpYoQBWzyoZUqJICchqQ3petbmBNz
I8nWqUAS4VaU68Ics1n4N32KQ+WuFM1FfzgVk/KNB/j4iebXpB9lSTjz9s75P8cH
jWIx9zDiwXv+cGS8U9ezjri5hdedsiG/tUo4iRvrxtXCmP9yMGRglDsXfE8F61ai
1UaU3/34gVRjLmWX+KBVwoiBkif5IiGtBlg9tArrp1t98lFPpTahTpKoLEIvThPv
G6t3G8anOiL63QNj2pZVGoz7rr4XiT2A+RTB1yj48cPu1tKDVOa3M0QS79yF/FX3
gNDzgFvry++o4x+V7rLgV1Tvd/+aie8kmimb2AsxbHs+hkSeymMCsPLC+GOiCwVv
2YhCNXC9ZkJwAbbHLddytgkw/jChPCOm3W80YLjHaqUrZKne7+ZovNpzQbYR1vG2
W6JqBCGHv+1i02A75WFDZqgSMTf8APFgDjXm9gx0AnVAzZxUcsWmDrLQiSug8fay
5R0SHAxTmZZIQ2P+20eXpyS13OyrgMwbeUIjH0QvFRvf21rgSv0gcyy6fGUkgylA
qLvCn6C8Skgjl91IZP95oKcwlS4=
-----END CERTIFICATE-----
                                                                                                            QVybmQtYXJ1LW9jdDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQx
CzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJl
cm5kMB4XDTEwMTAxMjE0MDAxMVoXDTExMDExMDE1MDAxMVowazEWMBQGA1UEAxMN
YmVybmQtYXJ1LW9jdDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJ
BgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5k
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAv0yfHz81m0S9eAtr4MlW
cLBsXBcjpME/eawnmUu5Swt2PZ5PuK0LHUzyby1dFuJiBsoTk+4IkG3seRu7IWU3
Xr1bxAP4NvRfjRc3ncLoYv8573AoNEiB4IdzLTeCR90FPleIE+9OZ1dcJCB2I6sT
06YXZePcoly0EhBjRx4SsI3/oaM7s5hqm8+m1Gg3l8BUcbxMtSyAn5jKHU/5iFyj
BDq5uvEffDXRqx5JMx2NByeQh52MvEzNi9KaxLQz6DR7jJdKe1fkZqV2C5oJ06fs
h55O9M/Z5LmIBxgVoPX+iRwXE+yaopJpZ2fSrugZm64xI/w2zqCugS4ZakMX5Rg5
i8TtlU20g1kkuVMhycb63KTxkaVE7/0XrrLG8bAKRrqM4+RL3Md9+DPThoch3C/M
Dgb3IJFg68JWxNcTbj2neb81C0JbWtHzNz6ViStTg4tI5DY7UmdnxTAPkE3BKtDY
VxTODw83kcR/M1yz5GQIEdqZL1/+OfmKY7F8mlw5Lspr3DuANNRh92SC8KbLzExO
gsKwbb3S1ASF5/TbHRSJSHtePZfROn/mKJM3WCS3/5C/julJAQM8CiWKQh/DWR/k
XbJsq08H5uTzvyBFXAeipiM/xOYmXDGlVe84/A9A8crMkxcnqZX    KXb8/fXiHcNzgrfqmQsPN2OWmCAx1r0
JGQmXFtSkJMHXqQciy+IL+D7orvH5oyiYUR7AgMBAAGjWDBWMB0GA1UdDgQWBBSA
L6nHdXnbX6rvF20VwGwZMmMb6zASBgNVHRMBAf8ECDAGAQEBAgEIMCEGA1UdEQQa
MBiBFmJlcm5kLnN0cmFtbUBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQADggIBAErx
UjHu/4Zo8xmGoJ4PDDwoaUyWOBt6B4dr5mbo8TBNTVIs86gFI0mTwY4/g135wjqp
WuospIBW0gCwU34gDqgYI3xK9YAVpt0HPWVGj5KFckrAAQ7FObFcUvOeQ4g8KJd1
mmnp4YsdtvRpb09m71px+eVxfpDvywmVni+Y5eouOQn0x7fzolGnc3RVZPIMqant
QYaVY1lPqB7AxJtOG8wyWiAbNUvurmekM0gVaTUdpco8GtmEVe2SyGbKuLGQGRFL
ZuWtcMtK+L3T5DvXGGiE2cK3HXnmYEYsHRdQ/Qe2k4OqdljwfTBIU1SqczcAz7AE
q82iRM6gOHnT8iYv2bgrKBDOiNMyyQx48ZRfJd+8pvox1ZGo8HtPmpcR9xg/s5F2
cqSDU/ja+7jhPFojhryUcl1GJ3+MgNzXJmcYuQK5IIzkYPrgU1vACOVnggFcO+nU
clU+sV0A3KeL4gu6Jl+Wej2B0F9kb7WbhA+qvLT6WlWheP0Ua/qeJUjqezyXZ11M
TC9SI1bzCJFKoMZz6tIm/C5QlaVGGO3TpxJ22dHaUnnQ/Eg5D1VngN5THsrPyF5z
0FY5OlZ4ztI6d+35zGGPCNQoeHJrQntjXWoz2rrRZloPq3SM8d/quVc8WO4z3Mhp
mmnJMrGb9nPihikzhujNSQ1KCD0si6ttRqiDuusD
-----END CERTIFICATE-----
                                                                               SDEbMBkGA1UE
AxMSYmVybmQtYmFyYmFkb3Mtbm92MQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHV2Vs
bGFuZDELMAkGA1UECBMCT04xFTATBgNVBAoTDEJlcm5kIFN0cmFtbTEOMAwGA1UE
CxMFQmVybmQwHhcNMTAxMDEyMDA0NDI5WhcNMTEwMTEwMDE0NDI5WjBwMRswGQYD
VQQDExJiZXJuZC1iYXJiYWRvcy1ub3YxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdX
ZWxsYW5kMQswCQYDVQQIEwJPTjEVMBMGA1UEChMMQmVybmQgU3RyYW1tMQ4wDAYD
VQQLEwVCZXJuZDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOL96sGp
/HgpcNy9wvDxTTHr1Slq7V7CW9OH0h5da9Bbp6fcPmOe9TW3WiQnd3fAjkjipPw2
j1NojnpqW3ks3cF+NEED5DKfCeA5vdeAZiUKdVq+yxkzqhYc1hvQs6ucqCMZw0Cl
4l6H7+7B+n8qUoxvIAhmlRm5KdRXDmeyEQThxyNDu0fxwjwq/JK4vyIXNWQV2/tz
CylEURqVuvoCDKWbym0u+aA4h5p7Y+kSniTdk5BryKdsd+J1fZnA9V8VOgRoyg2n
V++wQ6EVHcY4pYCq0ebDQXqZcnbvWpE/ixPEoQWu8S8h1aGHoQVn4YpINcSA6CZT
GeOXZtZm+gvNHzZxD2b0/hxuGCfKMZFh54tW+CQwu7M1eZN2soQNMtVz1MJoreNJ
jev5UHJj3GUc9GEFkZJE1wXf16kJxuOAGd2HxrX/G3ecVd6S4u1dOwL2RgTOFahK
0Fqfk2uTrJtuz7ZVRR2+L2DOEsOrcxqYJzhgCzEVRhoESh/A9HzN6yNRb/7TGfY8
Fpw2s7x+EXg3SF6G6rqTypgUNSw9u/UAyAWTSk87QL8MNLNugKMs6c6FihJxhSCG
1xLlcCvBhBKLO2Hyx+1CmDrSxoZWYrsWy    iBAMrKp4tc4fy
eAYDMcpSYYPybzUCAwEAAaNYMFYwHQYDVR0OBBYEFCw4K/53bEVBlvtbo8LRgV2Z
nzSNMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEWYmVybmQuc3RyYW1t
QGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEAVE2T+lMoCJTMJfIVH9PXIfmG
+qxPy7a2/0eozV2a3pcNNsic/gU5LPn9FsNiLXxactdBQdeeWogS85gQaNI4CRK9
pEDkziGi119EhYT6fNURQTiUoP20uw16NzLVigSYuK9a7rGDHYaQ1/5VG0v0beVv
jRwoIIN2DvhQPxsaHMaRlh/uw4YMZzVW7u1mZ9c/ucWb0xuquLFsFC6ZQwf4Cl50
RSjh5d2yDhqOXn/smIQhz0fooMhTFgSDMOJ1/8CUbSr0g7xeRb9sjBvpgC+BYHiz
Ej+Q1OlhjBCqY2YeXkG3rbvpxmR5gdgJD6862+9/bta0XhLTbzHVA2Vl2B/cUGgD
DGYoWORKzSE0S4eJQZiD4/izVQK629Oh6oC4UxLAb1kW/4yNUh2JH/hgKVdY4B8n
Gl8+TQMFOR8pepRj4+NFRLDAsEr/c0bhNwye+tq1fFg1kFLLHfE6xg5InuW/Iz21
eY7J8/Lz4Qghu7QIKmx3hstRBPfQM/K4a7lhL5h69J0wZfI3xmcDhwD1alxpWD3N
OBM45aKvuvhGG3cXNZsy50iT3IPb3Ue6XluunLk2rDg2FTtExdVmHPKh51elPWAG
o7rWV3nBdzDEUwlHeGEbafaIlT9P2G+IDE/hI1WakHVyzg+agVajPAoO94DU4mkG
JwVNaddSL7S5AilGR4g=
-----END CERTIFICATE-----
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \VybmQtcGlyeC1zZXAxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNV
BAsTBUJlcm5kMB4XDTEwMDkwNDAyNTgyMFoXDTEwMTAwNDAyNTgyMFowcTEXMBUG
A1UEAxMOYmVybmQtcGlyeC1zZXAxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxs
YW5kMRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAM
BgNVBAsTBUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA1NiR
ALWny5EYhudvH27suopx9F4R7/jtaH6j7/ua6fB0qgJmxZ98TghIniJbwDE+Eyxc
wSSlaP8LCr6CJNlij4Syp0aTMq9s5deFYCPMFh32lvWvM5gJFknBThZZSoodp77B
N5DoiDgBoOxY/qlGwM7aAK+KjibGiCZkto9hJjal6ivJ3igODPwd1h9Kawp6d0sX
AAE6eKrJgd2kX5tPCjJaBySQOPQwsHIyaaH8sSVV8FdF7OiUMm2DhA/AYpgznBNE
Z2v4ANaW1JE8pLmV2MlslOkr/qtYmim1lWgpctvwZtlxdAGhLsSRPKfd2w3N+FYn
/x9vVoQiDRg/pI3FTqTVGpySOawEaw1k9WoZas2rASePUcR7PpBTapv9UN843Dpt
kq8My9ikeJjFrgyfFTK8LR6kQ4B06K9eZ3ZYXnkjQISoZTRbUW2nd9M1jWfGoUQS
X4ias5JxQMrfeVctOsVDcp13QA+dAhdd0DDVIBVl0ULVnVRHJbVyJUDry/3KC0A4
pB83WZ67HNaii2yO2HRXH7jas3U+ipr8xPmQRLGEWvJBL71wFDI3dlDns7ZhyCrm
hyMDZ+eaBUPDSY33f51/it3OxU8XwkgCYhzJm8v5IFUwK8Wtyg6    jA7BBkbnryqe6
YHHMubWQxk8EhU1m30WlWK/AkubhTABzOqUCWo0CAwEAAaNYMFYwHQYDVR0OBBYE
FGYPFnRBH3mMGk6Hvv2I/fEvfCK6MBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0R
BBowGIEWYmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEA
iFgklM1ODGGuLRF4396xfRBzI+dp753CTyI3TpOQhsRlNqi28UezTyBPr6jGkkMo
UnpXREzM/f2yHO2fxWKfIcM3Dfa5PSR85VZOag+XWeaNZOEdRR2yHLGSRzUzRLbp
aJlwDQRiRG0h9wm54R1y77Iyjn6rIqe7PAHP1AVNl/+l+Yn9nz7eMovwkc28SZFj
MOjsCeNPzuKjBTr0TRYGyk90dglxEa402Lp4sNU5IoJYb7ytqfpaxd4hcFhwv2c7
sbDzINHdsLrMBT5ph5OnamICFivg7EEHHkkQFOf5DIeBNtcyr3Ki5NxnxepqstWc
pifbAXWjcikRGy+Vroa1JKh9yrjnfKvnGDWp4yK4I4I+AS1JfLUeUxT5PHAwtGbU
Qen8OuaF1nn/7tKye+0GtOYUGmTGUzd0GFHoYdnF3fo3cDObmF3VFxsulwWMpTI3
GEUWJA/j+i4Xnk5YgzTASVPj1DpvqQ1vZ9ubUctngKcZFztz2L13YCitaLqPTxrp
c7MCr2kM/MHMmAYBHbZWxuJY7S1sNJluL55yo44E3Sher23j0ZH5in4IScv22ASg
hQv4z1miExzyb7Fc2WxAXBHuIecfYKAf0RMVVdIWoy7ujW+2iEtyfb54NwjFH60N
mDq3PzSdURJbpK6pwTfU6JLITUtDtCJUac7Qh2Nubs0=
-----END CERTIFICATE-----
                                                                                            ^BUGA1UE
AxMOYmVybmQtcGlyeC1zZXAxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxsYW5k
MRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNV
BAsTBUJlcm5kMB4XDTEwMDkwNDAyNTgyMFoXDTEwMTAwNDAyNTgyMFowcTEXMBUG
A1UEAxMOYmVybmQtcGlyeC1zZXAxCzAJBgNVBAYTAkNBMRAwDgYDVQQHEwdXZWxs
YW5kMRAwDgYDVQQIEwdPbnRhcmlvMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAM
BgNVBAsTBUJlcm5kMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA1NiR
ALWny5EYhudvH27suopx9F4R7/jtaH6j7/ua6fB0qgJmxZ98TghIniJbwDE+Eyxc
wSSlaP8LCr6CJNlij4Syp0aTMq9s5deFYCPMFh32lvWvM5gJFknBThZZSoodp77B
N5DoiDgBoOxY/qlGwM7aAK+KjibGiCZkto9hJjal6ivJ3igODPwd1h9Kawp6d0sX
AAE6eKrJgd2kX5tPCjJaBySQOPQwsHIyaaH8sSVV8FdF7OiUMm2DhA/AYpgznBNE
Z2v4ANaW1JE8pLmV2MlslOkr/qtYmim1lWgpctvwZtlxdAGhLsSRPKfd2w3N+FYn
/x9vVoQiDRg/pI3FTqTVGpySOawEaw1k9WoZas2rASePUcR7PpBTapv9UN843Dpt
kq8My9ikeJjFrgyfFTK8LR6kQ4B06K9eZ3ZYXnkjQISoZTRbUW2nd9M1jWfGoUQS
X4ias5JxQMrfeVctOsVDcp13QA+dAhdd0DDVIBVl0ULVnVRHJbVyJUDry/3KC0A4
pB83WZ67HNaii2yO2HRXH7jas3U+ipr8xPmQRLGEWvJBL71wFDI3dlDns7ZhyCrm
hyMDZ+eaBUPDSY33f51/it3OxU8XwkgCYhzJm    8v5IFUwK8Wtyg6jA7BBkbnryqe6
YHHMubWQxk8EhU1m30WlWK/AkubhTABzOqUCWo0CAwEAAaNYMFYwHQYDVR0OBBYE
FGYPFnRBH3mMGk6Hvv2I/fEvfCK6MBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0R
BBowGIEWYmVybmQuc3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEA
iFgklM1ODGGuLRF4396xfRBzI+dp753CTyI3TpOQhsRlNqi28UezTyBPr6jGkkMo
UnpXREzM/f2yHO2fxWKfIcM3Dfa5PSR85VZOag+XWeaNZOEdRR2yHLGSRzUzRLbp
aJlwDQRiRG0h9wm54R1y77Iyjn6rIqe7PAHP1AVNl/+l+Yn9nz7eMovwkc28SZFj
MOjsCeNPzuKjBTr0TRYGyk90dglxEa402Lp4sNU5IoJYb7ytqfpaxd4hcFhwv2c7
sbDzINHdsLrMBT5ph5OnamICFivg7EEHHkkQFOf5DIeBNtcyr3Ki5NxnxepqstWc
pifbAXWjcikRGy+Vroa1JKh9yrjnfKvnGDWp4yK4I4I+AS1JfLUeUxT5PHAwtGbU
Qen8OuaF1nn/7tKye+0GtOYUGmTGUzd0GFHoYdnF3fo3cDObmF3VFxsulwWMpTI3
GEUWJA/j+i4Xnk5YgzTASVPj1DpvqQ1vZ9ubUctngKcZFztz2L13YCitaLqPTxrp
c7MCr2kM/MHMmAYBHbZWxuJY7S1sNJluL55yo44E3Sher23j0ZH5in4IScv22ASg
hQv4z1miExzyb7Fc2WxAXBHuIecfYKAf0RMVVdIWoy7ujW+2iEtyfb54NwjFH60N
mDq3PzSdURJbpK6pwTfU6JLITUtDtCJUac7Qh2Nubs0=
-----END CERTIFICATE-----
                                                                               UVybmQtYXJjaDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJ
BgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5k
MB4XDTEwMTAyNzAyNTI1MloXDTEwMTEyNjAzNTI1MlowaDETMBEGA1UEAxMKYmVy
bmQtYXJjaDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJBgNVBAgT
Ak9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5kMIICIjAN
BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2HVi6yL+kyZr4Io/aHHTtwIkeHef
DAUGS8rwyFUwJvNmdE8qrEKQg8QEcL2cBDHKjo6SHsER+qSduuFw3ZtzcRxzyv4P
PX2YvE36y6LsscONJE9jDYVCDvuA7k8on++1Ul3M3BmVgr0aYB+BCqB+L9b1YjPI
EeYpAe2sZ56lrspiHBE4vJYKwKaR9YrSPweWaUSWX9I+vd6yOwLvP7xH5i2zbLdU
NRp/LYmqou+cddQsHlbzNJocc7qnvwzqFKhY4GvUqlSafkmHxgrks6GTWJ1M4fqv
rnBbY7x3uKd4DstJ1hLBgsXKhAdKLb+jb4UlWxbXqXD8UJcbKZ2vRWPQJEfHuNkg
6UIJd+VEg3XTwX3cacnBFqKhwhjYPWCgHTiGoMipfDi063ELxUKwr3C+gLNoHMit
dPidl6w0VGhrL7zpqfkoRICC1dbcEmb5u5f0xz+jZbXRHki+77pW6cPGgjbO6h+c
8cMnV1pc42tvzR9kChZ6ZD71rA2khQVpaVduh4wtEXfAEO+G32g3AIj5sNtJHqAY
/zISqOtBR5bfxUoa+Rpf2gwR4o3dRaymi5CGYEFHtJTJYD4MbyUoEqYE21PEOVyN
ZlxfmdaZxRUUusDvB1HrB2szx3CXlT3y1ZRbugUTvX6AXzq1sx1    9A8crMkxcnqZXuvv39AcoMEjrk
clmZJJMtIGsuAl+8MP7iNu0CAwEAAaNYMFYwHQYDVR0OBBYEFCWXznkfCtduJp7c
BI5ji7ksP/AwMBIGA1UdEwEB/wQIMAYBAQECAQgwIQYDVR0RBBowGIEWYmVybmQu
c3RyYW1tQGdtYWlsLmNvbTANBgkqhkiG9w0BAQUFAAOCAgEAVchzAtpDzLZKX1Tt
l1WaVA24WdCeLHaQp7p5fGBSePxrXcbEKdXAC5rATqpZzaTUXHp6Hnps1xrv5T1i
J2iIB8MAI3ZvRVIwuT9yBY0eqZgriATFN7PVpYoQBWzyoZUqJICchqQ3petbmBNz
I8nWqUAS4VaU68Ics1n4N32KQ+WuFM1FfzgVk/KNB/j4iebXpB9lSTjz9s75P8cH
jWIx9zDiwXv+cGS8U9ezjri5hdedsiG/tUo4iRvrxtXCmP9yMGRglDsXfE8F61ai
1UaU3/34gVRjLmWX+KBVwoiBkif5IiGtBlg9tArrp1t98lFPpTahTpKoLEIvThPv
G6t3G8anOiL63QNj2pZVGoz7rr4XiT2A+RTB1yj48cPu1tKDVOa3M0QS79yF/FX3
gNDzgFvry++o4x+V7rLgV1Tvd/+aie8kmimb2AsxbHs+hkSeymMCsPLC+GOiCwVv
2YhCNXC9ZkJwAbbHLddytgkw/jChPCOm3W80YLjHaqUrZKne7+ZovNpzQbYR1vG2
W6JqBCGHv+1i02A75WFDZqgSMTf8APFgDjXm9gx0AnVAzZxUcsWmDrLQiSug8fay
5R0SHAxTmZZIQ2P+20eXpyS13OyrgMwbeUIjH0QvFRvf21rgSv0gcyy6fGUkgylA
qLvCn6C8Skgjl91IZP95oKcwlS4=
-----END CERTIFICATE-----
                                                                                                `QGA1UE
AxMNYmVybmQtYXJ1LW9jdDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQx
CzAJBgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJl
cm5kMB4XDTEwMTAxMjE0MDAxMVoXDTExMDExMDE1MDAxMVowazEWMBQGA1UEAxMN
YmVybmQtYXJ1LW9jdDELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB1dlbGxhbmQxCzAJ
BgNVBAgTAk9OMRUwEwYDVQQKEwxCZXJuZCBTdHJhbW0xDjAMBgNVBAsTBUJlcm5k
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAv0yfHz81m0S9eAtr4MlW
cLBsXBcjpME/eawnmUu5Swt2PZ5PuK0LHUzyby1dFuJiBsoTk+4IkG3seRu7IWU3
Xr1bxAP4NvRfjRc3ncLoYv8573AoNEiB4IdzLTeCR90FPleIE+9OZ1dcJCB2I6sT
06YXZePcoly0EhBjRx4SsI3/oaM7s5hqm8+m1Gg3l8BUcbxMtSyAn5jKHU/5iFyj
BDq5uvEffDXRqx5JMx2NByeQh52MvEzNi9KaxLQz6DR7jJdKe1fkZqV2C5oJ06fs
h55O9M/Z5LmIBxgVoPX+iRwXE+yaopJpZ2fSrugZm64xI/w2zqCugS4ZakMX5Rg5
i8TtlU20g1kkuVMhycb63KTxkaVE7/0XrrLG8bAKRrqM4+RL3Md9+DPThoch3C/M
Dgb3IJFg68JWxNcTbj2neb81C0JbWtHzNz6ViStTg4tI5DY7UmdnxTAPkE3BKtDY
VxTODw83kcR/M1yz5GQIEdqZL1/+OfmKY7F8mlw5Lspr3DuANNRh92SC8KbLzExO
gsKwbb3S1ASF5/TbHRSJSHtePZfROn/mKJM3WCS3/5C/julJAQM8CiWKQh/DWR/k
XbJsq08H5uTzvyBFXAeipiM/xOYmXDGlVe84/A