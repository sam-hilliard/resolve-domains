# resolve_domains

`resolve_domains.sh` is a bash script used to filter only the resolvable domains from a list of gathered subdomains. This script helps focus reconnaissance efforts by excluding domains that cannot be resolved to an IP address, ensuring that only reachable domains are considered.

## Purpose

The purpose of `resolve_domains.sh` is to streamline the process of filtering out non-resolvable domains obtained during reconnaissance activities. By focusing on resolvable domains, bug hunters and security professionals can prioritize their efforts on targets that are accessible, reducing noise and improving efficiency.

## Usage

### Running resolve_domains.sh

To use `resolve_domains.sh`, provide a file containing a list of subdomains as an argument, or pipe the subdomains directly into the script.

```bash
./resolve_domains.sh subdomains.txt
```

or

```bash
cat subdomains.txt | ./resolve_domains.sh
```

### Example Usage

Suppose `subdomains.txt` contains the following list of subdomains:
```
sub1.example.com
sub2.anotherdomain.com
sub3.outofscope.com
sub4.example.com
```

Running `resolve_domains.sh` with this file will produce the following output:
```
sub1.example.com
sub2.anotherdomain.com
sub4.example.com
```

### Notes

- The script uses DNS resolution to determine if a domain is valid and resolvable.
- Ensure that the input file is formatted correctly, with one domain per line.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
